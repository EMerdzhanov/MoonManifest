#!/usr/bin/env python3
"""
Generates a 1024x1024 moon app icon for MoonManifest.
Background: deep indigo #0A0E1A
Moon: silver crescent #E8E8F0 with gold glow #D4A574
"""

from PIL import Image, ImageDraw, ImageFilter
import math

SIZE = 1024
ICON_PATH = "assets/icon/app_icon.png"

img = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
draw = ImageDraw.Draw(img)

# --- Background circle (rounded square feel via ellipse) ---
BG_COLOR = (10, 14, 26, 255)          # #0A0E1A
draw.ellipse([0, 0, SIZE - 1, SIZE - 1], fill=BG_COLOR)

# --- Gold glow layer (soft halo behind moon) ---
GLOW_COLOR = (212, 165, 116)          # #D4A574
glow_layer = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
glow_draw = ImageDraw.Draw(glow_layer)

cx, cy = SIZE // 2, SIZE // 2
moon_r = 280          # radius of full-moon disk
offset = 195          # how far the "bite" circle is offset → controls crescent width

# Draw glow slightly larger than moon
glow_draw.ellipse(
    [cx - moon_r - 30, cy - moon_r - 30, cx + moon_r + 30, cy + moon_r + 30],
    fill=(*GLOW_COLOR, 60),
)
glow_layer = glow_layer.filter(ImageFilter.GaussianBlur(radius=60))
img = Image.alpha_composite(img, glow_layer)

# --- Moon disk ---
MOON_COLOR = (232, 232, 240, 255)     # #E8E8F0
moon_layer = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
moon_draw = ImageDraw.Draw(moon_layer)

moon_draw.ellipse(
    [cx - moon_r, cy - moon_r, cx + moon_r, cy + moon_r],
    fill=MOON_COLOR,
)

# --- Crescent "bite" — erase a circle offset to the right ---
# We paint the bite with the background colour to carve the crescent shape.
bite_cx = cx + offset
bite_r  = int(moon_r * 1.05)         # slightly larger so edges are clean
moon_draw.ellipse(
    [bite_cx - bite_r, cy - bite_r, bite_cx + bite_r, cy + bite_r],
    fill=(0, 0, 0, 0),
)

# Soft inner shadow on the crescent edge
shadow_layer = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
shadow_draw = ImageDraw.Draw(shadow_layer)
shadow_draw.ellipse(
    [bite_cx - bite_r, cy - bite_r, bite_cx + bite_r, cy + bite_r],
    fill=(10, 14, 26, 180),
)
shadow_layer = shadow_layer.filter(ImageFilter.GaussianBlur(radius=18))

img = Image.alpha_composite(img, moon_layer)
# subtract the glow that leaked into the bite area by repainting background
cleanup = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
cleanup_draw = ImageDraw.Draw(cleanup)
cleanup_draw.ellipse(
    [bite_cx - bite_r + 10, cy - bite_r + 10,
     bite_cx + bite_r - 10, cy + bite_r - 10],
    fill=BG_COLOR,
)
img = Image.alpha_composite(img, cleanup)

# --- Star dots — three small stars in upper-right area ---
STAR_COLOR = (232, 232, 240, 200)
star_positions = [
    (cx + 220, cy - 270, 6),
    (cx + 310, cy - 160, 4),
    (cx + 260, cy - 195, 3),
]
star_layer = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
star_draw = ImageDraw.Draw(star_layer)
for sx, sy, sr in star_positions:
    star_draw.ellipse([sx - sr, sy - sr, sx + sr, sy + sr], fill=STAR_COLOR)
img = Image.alpha_composite(img, star_layer)

# --- Composite onto white canvas for non-transparent formats ---
final = img.convert("RGBA")
final.save(ICON_PATH, "PNG")
print(f"Icon saved to {ICON_PATH}  ({SIZE}x{SIZE})")
