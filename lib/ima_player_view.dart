import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ImaPlayerView extends StatelessWidget {
  const ImaPlayerView();

  @override
  Widget build(BuildContext context) {
    const viewType = 'ssss';

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
            creationParams: {"license": "MvbyQ6F4Lr2s3FU6ZMgHT92stjkFg8qeNLJwF5FJh5tJauQennNFjyaUQywdrwGR", "channelKey": "rotana-drama"},
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
