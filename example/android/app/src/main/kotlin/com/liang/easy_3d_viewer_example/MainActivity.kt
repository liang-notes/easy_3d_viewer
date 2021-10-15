package com.liang.easy_3d_viewer_example

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.liang.easy_3d_viewer.Easy3dViewerPlugin


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        //注册插件
        flutterEngine.plugins.add(Easy3dViewerPlugin())
    }

}
