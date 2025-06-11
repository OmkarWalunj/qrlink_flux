library qrlink_flux;

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrLinkFlux extends StatefulWidget {
  final String fileUrl;
  final bool autoChange;
  final int intervalSeconds;
  final double size;

  const QrLinkFlux({
    super.key,
    required this.fileUrl,
    this.autoChange = false,
    this.intervalSeconds = 5,
    this.size = 200,
  });

  @override
  State<QrLinkFlux> createState() => _QrLinkFluxState();
}

class _QrLinkFluxState extends State<QrLinkFlux> {
  Timer? _timer;
  String _currentData = '';

  @override
  void initState() {
    super.initState();
    _generateBarcode();

    if (widget.autoChange) {
      _timer = Timer.periodic(
        Duration(seconds: widget.intervalSeconds),
        (_) => _generateBarcode(),
      );
    }
  }

  void _generateBarcode() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomString = _generateRandomString(6);
    setState(() {
      _currentData = '${widget.fileUrl}?ts=$timestamp&key=$randomString';
    });
  }

  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random();
    return String.fromCharCodes(
      Iterable.generate(
          length, (_) => chars.codeUnitAt(rand.nextInt(chars.length))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: _currentData,
      version: QrVersions.auto,
      size: widget.size,
      gapless: false,
    );
  }
}
