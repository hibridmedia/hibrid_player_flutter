import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ImaPlayerView extends StatelessWidget {
  final String license;
  final String channelKey;
  const ImaPlayerView(this.license, this.channelKey);

  @override
  Widget build(BuildContext context) {
    const viewType = 'HybridPlayer';

    final gestureRecognizers = <Factory<OneSequenceGestureRecognizer>>{
      Factory<OneSequenceGestureRecognizer>(
        () => EagerGestureRecognizer(),
      ),
    };

    if (Platform.isAndroid) {
      return PlatformViewLink(
        viewType: viewType,
        onCreatePlatformView: (params) {
          return PlatformViewsService.initAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: {"license": license, "channelKey": channelKey},
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () => params.onFocusChanged(true),
          )
            ..addOnPlatformViewCreatedListener((id) {
              params.onPlatformViewCreated(id);
            })
            ..create();
        },
        surfaceFactory: (context, controller) {
          return AndroidViewSurface(
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            controller: controller as AndroidViewController,
            gestureRecognizers: gestureRecognizers,
          );
        },
      );
    } else {
      return UiKitView(
        viewType: viewType,
        creationParams: {},
        gestureRecognizers: gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: (id) {},
      );
    }
  }
}
