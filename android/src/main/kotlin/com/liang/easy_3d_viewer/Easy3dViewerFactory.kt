package com.liang.easy_3d_viewer

import android.content.Context
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.plugin.common.MethodChannel


class Easy3dViewerFactory : PlatformViewFactory {
    private val methodChannel: MethodChannel

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return Easy3dViewer(context, viewId, args, this.methodChannel)
    }

    constructor(createArgsCodec: MessageCodec<Any>? ,methodChannel: MethodChannel): super(createArgsCodec) {
        this.methodChannel = methodChannel
    }
}