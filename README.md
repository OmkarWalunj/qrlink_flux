# qrlink_flux

`qrlink_flux` is a Flutter package that generates **dynamic QR codes** from **any file URL** (image, video, PDF, ZIP, etc.). You can enable **auto-refresh** to update the QR code periodically with new tokens.

## 🚀 Features

- ✅ Works with any file type (image, video, PDF, ZIP)
- 🔁 Optional auto-refresh every N seconds
- 🧩 Adds timestamp + random key for uniqueness
- 📦 Easy Flutter widget integration

## 🧪 Example

```dart
import 'package:flutter/material.dart';
import 'package:qrlink_flux/qrlink_flux.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('QR Link Flux Example')),
        body: const Center(
          child: QrLinkFlux(
            fileUrl: 'https://example.com/video.mp4',
            autoChange: true,
            intervalSeconds: 10,
            size: 250,
          ),
        ),
      ),
    );
  }
}
