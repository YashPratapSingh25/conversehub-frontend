import 'package:flutter/material.dart';

class ThemeShowcaseScreen extends StatelessWidget {
  const ThemeShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final colors = {
      "Primary": scheme.primary,
      "On Primary": scheme.onPrimary,
      "Secondary": scheme.secondary,
      "On Secondary": scheme.onSecondary,
      "Surface": scheme.surface,
      "On Surface": scheme.onSurface,
      "Error": scheme.error,
      "On Error": scheme.onError,
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Theme Showcase")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("Color Scheme", style: textTheme.headlineSmall),
          const SizedBox(height: 12),
          ...colors.entries.map((e) => Card(
            child: Container(
              color: e.value,
              padding: const EdgeInsets.all(16),
              child: Text(
                e.key,
                style: textTheme.bodyLarge!.copyWith(
                  color: ThemeData.estimateBrightnessForColor(e.value) ==
                      Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          )),
          const SizedBox(height: 24),
          Text("Buttons & Inputs", style: textTheme.headlineSmall),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () {}, child: const Text("Elevated Button")),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: () {}, child: const Text("Outlined Button")),
          const SizedBox(height: 12),
          TextField(decoration: const InputDecoration(labelText: "Sample Input"), onTapOutside: (event) => FocusScope.of(context).unfocus()),
        ],
      ),
    );
  }
}
