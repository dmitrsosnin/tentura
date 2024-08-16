import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

class QRScanDialog extends StatefulWidget {
  static Future<String?> show(BuildContext context) => showDialog<String>(
        context: context,
        builder: (context) => const QRScanDialog(),
      );

  const QRScanDialog({super.key});

  @override
  State<QRScanDialog> createState() => _QRScanDialogState();
}

class _QRScanDialogState extends State<QRScanDialog> {
  final _controller = MobileScannerController();

  bool _torchEnabled = false;
  bool _hasResult = false;

  late Rect _scanWindow;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.of(context).size;
    final scanAreaSize = switch (ScreenSize.get(size)) {
      ScreenSmall _ => size.width * 0.7,
      ScreenMedium _ => size.width * 0.7,
      ScreenLarge _ => size.width * 0.6,
      ScreenBig _ => size.width * 0.5,
    };
    _scanWindow = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: scanAreaSize,
      height: scanAreaSize,
    );
    _controller.updateScanWindow(_scanWindow);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Scan the QR Code'),
            actions: [
              IconButton(
                icon: _torchEnabled
                    ? const Icon(Icons.flashlight_off_outlined)
                    : const Icon(Icons.flashlight_on_outlined),
                onPressed: () async {
                  await _controller.toggleTorch();
                  setState(() => _torchEnabled = !_torchEnabled);
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              MobileScanner(
                controller: _controller,
                scanWindow: _scanWindow,
                onDetect: (BarcodeCapture captured) {
                  if (_hasResult || captured.barcodes.isEmpty) return;
                  if (context.mounted) {
                    _hasResult = true;
                    context.maybePop(captured.barcodes.first.rawValue);
                  }
                },
              ),
              CustomPaint(painter: _ScannerOverlay(frame: _scanWindow)),
            ],
          ),
        ),
      );
}

class _ScannerOverlay extends CustomPainter {
  _ScannerOverlay({required this.frame});

  final Rect frame;

  final _framePaint = Paint()
    ..color = Colors.white
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 8;

  final _maskPaint = Paint()
    ..color = Colors.deepPurple.withOpacity(0.5)
    ..style = PaintingStyle.fill
    ..blendMode = BlendMode.dstOut;

  late final _maskPath = Path.combine(
    PathOperation.difference,
    Path()..addRect(Rect.largest),
    Path()..addRect(frame),
  );

  late final _frameSize = frame.height / 5;

  late final _leftTop = Offset(frame.left, frame.top);
  late final _leftTopH = Offset(frame.left + _frameSize, frame.top);
  late final _leftTopV = Offset(frame.left, frame.top + _frameSize);

  late final _rightTop = Offset(frame.right, frame.top);
  late final _rightTopH = Offset(frame.right - _frameSize, frame.top);
  late final _rightTopV = Offset(frame.right, frame.top + _frameSize);

  late final _leftBottom = Offset(frame.left, frame.bottom);
  late final _leftBottomH = Offset(frame.left + _frameSize, frame.bottom);
  late final _leftBottomV = Offset(frame.left, frame.bottom - _frameSize);

  late final _rightBottom = Offset(frame.right, frame.bottom);
  late final _rightBottomH = Offset(frame.right - _frameSize, frame.bottom);
  late final _rightBottomV = Offset(frame.right, frame.bottom - _frameSize);

  @override
  bool shouldRepaint(_) => false;

  @override
  void paint(Canvas canvas, Size size) => canvas
    ..drawPath(_maskPath, _maskPaint)
    ..drawLine(_leftTop, _leftTopH, _framePaint)
    ..drawLine(_leftTop, _leftTopV, _framePaint)
    ..drawLine(_rightTop, _rightTopH, _framePaint)
    ..drawLine(_rightTop, _rightTopV, _framePaint)
    ..drawLine(_leftBottom, _leftBottomH, _framePaint)
    ..drawLine(_leftBottom, _leftBottomV, _framePaint)
    ..drawLine(_rightBottom, _rightBottomH, _framePaint)
    ..drawLine(_rightBottom, _rightBottomV, _framePaint);
}
