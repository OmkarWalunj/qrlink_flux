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
