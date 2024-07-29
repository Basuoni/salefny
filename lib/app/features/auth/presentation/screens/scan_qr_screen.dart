import 'dart:io';

import 'package:salefny/app/core/extensions/navigators.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/widgets/app_bar/default_app_bar.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class ScanQRScreen extends ConsumerStatefulWidget {
  const ScanQRScreen({super.key, this.onQRViewCreated});

  final ValueChanged<String>? onQRViewCreated;

  @override
  ConsumerState<ScanQRScreen> createState() => _LoginWithQrCodeScreenState();
}

class _LoginWithQrCodeScreenState extends ConsumerState<ScanQRScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool showHelpMessage = true;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr.scanQR,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: QRView(
                    key: qrKey,
                    overlay: QrScannerOverlayShape(
                      borderColor: AppColors.primary,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 300,
                    ),
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ],
            ),
          ),
          if (showHelpMessage)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.svgAlertCircle,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Width(8),
                  Expanded(
                    child: Text(
                      // Scan the QR code from your control panel to get the server link.
                      tr.scanQRCodeFromYourControlPanelToGetTheServerLink,
                      style: context.medium14Primary,
                    ),
                  ),
                  const Width(8),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showHelpMessage = false;
                      });
                    },
                    icon: SvgPicture.asset(
                      Assets.svgX,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      context.pop();

      widget.onQRViewCreated?.call(scanData.code ?? '');
    });
  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
