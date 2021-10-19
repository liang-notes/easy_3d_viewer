import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Easy3dViewer {
  static const MethodChannel _channel =
      const MethodChannel('plugins.flutter.io/easy_3d_viewer');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}

class Easy3dViewRender extends StatefulWidget {
  // final MiniVideoPlayerCreatedCallBack onCreated;
  final double x;
  final double y;
  final double width;
  final double height;

  Easy3dViewRender({
    Key? key,
    // required this.onCreated,
    required this.width,
    required this.height,
    this.x = 0,
    this.y = 0,
  }) : super(key: key);

  @override
  _Easy3dViewRenderState createState() => _Easy3dViewRenderState();
}

class _Easy3dViewRenderState extends State<Easy3dViewRender> {
  @override
  void initState() {
    super.initState();
    Easy3dViewer._channel.setMethodCallHandler(_handlerMethodCall);
  }

  Future<dynamic> _handlerMethodCall(MethodCall call) async{
    //获取通道监听中调用的函数名称
    String method = call.method;
    // if(method == 'addAndroidButtonAndNoticeFlutter'){
    //   String androidButtonClickedNumber = call.arguments['AndroidButtonClickedNumber'];
    //   setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: _setupNativeView(),
      onHorizontalDragStart: (DragStartDetails details) {},
      onHorizontalDragUpdate: (DragUpdateDetails details) {},
      onHorizontalDragEnd: (DragEndDetails details) {},
      onTapDown: (TapDownDetails details) {},
    );
  }

  Widget _setupNativeView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'plugins.flutter.io/easy_3d_viewer_native_view',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
          'x': widget.x,
          'y': widget.y,
          'width': widget.width,
          'height': widget.height,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: 'plugins.flutter.io/easy_3d_viewer_native_view',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
          'x': widget.x,
          'y': widget.y,
          'width': widget.width,
          'height': widget.height,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  Future<void> onPlatformViewCreated(id) async {
    // if (widget.onCreated != null) {
    //   widget.onCreated(new MiniVideoPlayerController.init(id));
    // }
  }
}
