import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MoonManifestApp()));
}

class MoonManifestApp extends StatelessWidget {
  const MoonManifestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoonManifest',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(child: Text('MoonManifest')),
      ),
    );
  }
}
