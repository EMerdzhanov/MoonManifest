import WidgetKit
import SwiftUI

// MARK: - Data Model

struct MoonWidgetData {
    let phaseName: String
    let phaseIndex: Int
    let dayInPhase: Int
    let totalDaysInPhase: Int
    let illumination: Double
    let nextEventLabel: String
    let progressFraction: Double

    static let placeholder = MoonWidgetData(
        phaseName: "Waxing",
        phaseIndex: 1,
        dayInPhase: 5,
        totalDaysInPhase: 14,
        illumination: 0.35,
        nextEventLabel: "Full Moon in 9 days",
        progressFraction: 0.36
    )

    init(
        phaseName: String,
        phaseIndex: Int,
        dayInPhase: Int,
        totalDaysInPhase: Int,
        illumination: Double,
        nextEventLabel: String,
        progressFraction: Double
    ) {
        self.phaseName = phaseName
        self.phaseIndex = phaseIndex
        self.dayInPhase = dayInPhase
        self.totalDaysInPhase = totalDaysInPhase
        self.illumination = illumination
        self.nextEventLabel = nextEventLabel
        self.progressFraction = progressFraction
    }

    init(from userDefaults: UserDefaults) {
        self.phaseName = userDefaults.string(forKey: "moon_phase_name") ?? "Waxing"
        self.phaseIndex = userDefaults.integer(forKey: "moon_phase_index")
        self.dayInPhase = userDefaults.integer(forKey: "moon_day_in_phase")
        self.totalDaysInPhase = max(userDefaults.integer(forKey: "moon_total_days_in_phase"), 1)
        self.illumination = userDefaults.double(forKey: "moon_illumination")
        self.nextEventLabel = userDefaults.string(forKey: "moon_next_event_label") ?? "Open app to sync"
        self.progressFraction = userDefaults.double(forKey: "moon_progress_fraction")
    }
}

// MARK: - Timeline Provider

struct MoonPhaseTimelineProvider: TimelineProvider {
    private let appGroupId = "group.com.moonmanifest.moonManifest"

    func placeholder(in context: Context) -> MoonPhaseEntry {
        MoonPhaseEntry(date: Date(), data: .placeholder)
    }

    func getSnapshot(in context: Context, completion: @escaping (MoonPhaseEntry) -> Void) {
        let data = loadData()
        completion(MoonPhaseEntry(date: Date(), data: data))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MoonPhaseEntry>) -> Void) {
        let data = loadData()
        let entry = MoonPhaseEntry(date: Date(), data: data)
        // Refresh every 30 minutes.
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }

    private func loadData() -> MoonWidgetData {
        guard let userDefaults = UserDefaults(suiteName: appGroupId) else {
            return .placeholder
        }
        return MoonWidgetData(from: userDefaults)
    }
}

// MARK: - Timeline Entry

struct MoonPhaseEntry: TimelineEntry {
    let date: Date
    let data: MoonWidgetData
}

// MARK: - Theme Colors

struct MoonTheme {
    static let background = Color(red: 10/255, green: 14/255, blue: 26/255)
    static let moonSilver = Color(red: 232/255, green: 232/255, blue: 240/255)
    static let textPrimary = Color(red: 232/255, green: 232/255, blue: 240/255)
    static let textSecondary = Color(red: 144/255, green: 152/255, blue: 184/255)
    static let goldAccent = Color(red: 212/255, green: 165/255, blue: 116/255)
}

// MARK: - Moon Shape View

struct MoonShapeView: View {
    let illumination: Double
    let phaseIndex: Int
    let size: CGFloat

    var body: some View {
        ZStack {
            // Base circle (dark side)
            Circle()
                .fill(MoonTheme.background.opacity(0.6))
                .frame(width: size, height: size)
                .overlay(
                    Circle()
                        .stroke(MoonTheme.moonSilver.opacity(0.3), lineWidth: 1)
                )

            // Illuminated portion
            MoonIlluminationShape(illumination: illumination, isWaning: phaseIndex >= 3)
                .fill(MoonTheme.moonSilver)
                .frame(width: size, height: size)
                .shadow(color: MoonTheme.moonSilver.opacity(0.4), radius: size * 0.15)
        }
    }
}

struct MoonIlluminationShape: Shape {
    let illumination: Double
    let isWaning: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2

        if illumination <= 0.01 {
            // New moon: show nothing (empty path)
            return path
        }

        if illumination >= 0.99 {
            // Full moon: full circle
            path.addEllipse(in: rect)
            return path
        }

        // Draw a crescent using two arcs.
        // The right half is always drawn as a semicircle arc.
        // The left edge is an elliptical arc whose x-radius depends on illumination.

        let terminatorX = radius * CGFloat(abs(2 * illumination - 1))
        let bulge = illumination > 0.5

        // Start from top
        if isWaning {
            // Illuminated on the left side
            path.addArc(center: center, radius: radius,
                        startAngle: .degrees(-90), endAngle: .degrees(90),
                        clockwise: true)
            // Terminator arc
            addTerminatorArc(&path, center: center, radius: radius,
                             terminatorX: terminatorX, bulge: bulge,
                             fromTop: false)
        } else {
            // Illuminated on the right side
            path.addArc(center: center, radius: radius,
                        startAngle: .degrees(-90), endAngle: .degrees(90),
                        clockwise: false)
            // Terminator arc
            addTerminatorArc(&path, center: center, radius: radius,
                             terminatorX: terminatorX, bulge: !bulge,
                             fromTop: false)
        }

        path.closeSubpath()
        return path
    }

    private func addTerminatorArc(_ path: inout Path, center: CGPoint,
                                   radius: CGFloat, terminatorX: CGFloat,
                                   bulge: Bool, fromTop: Bool) {
        // Approximate the terminator with a cubic bezier
        let top = CGPoint(x: center.x, y: center.y - radius)
        let bottom = CGPoint(x: center.x, y: center.y + radius)

        let cpOffset = terminatorX * 0.55 // Bezier approximation factor

        let sign: CGFloat = bulge ? -1 : 1

        let cp1 = CGPoint(x: center.x + sign * cpOffset, y: center.y + radius * 0.55)
        let cp2 = CGPoint(x: center.x + sign * cpOffset, y: center.y - radius * 0.55)

        path.addCurve(to: top, control1: cp1, control2: cp2)
    }
}

// MARK: - Small Widget View

struct SmallMoonWidgetView: View {
    let data: MoonWidgetData

    var body: some View {
        ZStack {
            MoonTheme.background

            VStack(spacing: 6) {
                MoonShapeView(
                    illumination: data.illumination,
                    phaseIndex: data.phaseIndex,
                    size: 52
                )

                Text(data.phaseName)
                    .font(.system(size: 14, weight: .semibold, design: .serif))
                    .foregroundColor(MoonTheme.textPrimary)

                Text(data.nextEventLabel)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(MoonTheme.goldAccent)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .padding(12)
        }
    }
}

// MARK: - Medium Widget View

struct MediumMoonWidgetView: View {
    let data: MoonWidgetData

    var body: some View {
        ZStack {
            MoonTheme.background

            HStack(spacing: 16) {
                // Left: moon visual
                VStack(spacing: 6) {
                    MoonShapeView(
                        illumination: data.illumination,
                        phaseIndex: data.phaseIndex,
                        size: 56
                    )

                    Text(data.phaseName)
                        .font(.system(size: 14, weight: .semibold, design: .serif))
                        .foregroundColor(MoonTheme.textPrimary)
                }

                // Right: details and progress bar
                VStack(alignment: .leading, spacing: 8) {
                    Text(data.nextEventLabel)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(MoonTheme.goldAccent)
                        .lineLimit(1)

                    Text("Day \(data.dayInPhase) of \(data.totalDaysInPhase)")
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(MoonTheme.textSecondary)

                    // Progress bar
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Cycle Progress")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(MoonTheme.textSecondary)

                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(MoonTheme.textSecondary.opacity(0.2))
                                    .frame(height: 6)

                                RoundedRectangle(cornerRadius: 3)
                                    .fill(
                                        LinearGradient(
                                            colors: [MoonTheme.moonSilver, MoonTheme.goldAccent],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(
                                        width: geometry.size.width * CGFloat(data.progressFraction),
                                        height: 6
                                    )
                            }
                        }
                        .frame(height: 6)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(14)
        }
    }
}

// MARK: - Widget Configuration

struct MoonPhaseWidget: Widget {
    let kind: String = "MoonPhaseWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MoonPhaseTimelineProvider()) { entry in
            if #available(iOS 17.0, *) {
                MoonPhaseWidgetEntryView(entry: entry)
                    .containerBackground(MoonTheme.background, for: .widget)
            } else {
                MoonPhaseWidgetEntryView(entry: entry)
            }
        }
        .configurationDisplayName("Moon Phase")
        .description("See the current lunar phase and upcoming events.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct MoonPhaseWidgetEntryView: View {
    @Environment(\.widgetFamily) var family
    var entry: MoonPhaseEntry

    var body: some View {
        switch family {
        case .systemMedium:
            MediumMoonWidgetView(data: entry.data)
        default:
            SmallMoonWidgetView(data: entry.data)
        }
    }
}

// MARK: - Widget Bundle

@main
struct MoonPhaseWidgetBundle: WidgetBundle {
    var body: some Widget {
        MoonPhaseWidget()
    }
}
