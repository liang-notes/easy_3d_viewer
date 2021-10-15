package com.liang.easy_3d_viewer

import android.app.Activity
import android.view.View
import com.l1inc.viewer.Course3DViewer
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import android.content.Context
import android.view.LayoutInflater
import com.l1inc.viewer.Course3DRendererBase
import com.l1inc.viewer.HoleWithinCourse
import com.l1inc.viewer.common.Viewer

class Easy3dViewer: PlatformView {
    private var course3DViewer: Course3DViewer
    private var methodChannel : MethodChannel

    constructor(context: Context?, viewId: Int, args: Any?, channel: MethodChannel):super() {
        course3DViewer = getCourse3DViewer(context, args)
        methodChannel = channel
    }


//    fun load3DViewer() {
//        setContentView(R.layout.easy_3d_viewer)
//        val viewer = findViewById<Course3DViewer>(R.id.course3DViewer)
//        //API Key  AiO_bcBB3lee-fY
//        //Secret Key CtnoTRtmC6TLvMHPHsg2cZjSaZsaPq
////        Course3DRenderer
//        val data = PaceOfPlay.Builder("HkDYyWSIHZre","sss").create()
//        val courseVectorData = HashMap<String,String>()
//        val pins = HashMap<String,List<PinPositionOverride>>()
//
//        viewer.viewer.setCurrentHole(3,false, 1)
//        viewer.viewer.init(
//            courseVectorData,
//            false,
//            true,
//            null,
//            null,
//            false,
//            data
//        )
//    }

    override fun getView(): View {
        return course3DViewer
    }

    override fun dispose() {
        course3DViewer.invalidate()
    }

    private fun getCourse3DViewer(context: Context?, args: Any?): Course3DViewer {
        val easy3dView =
            LayoutInflater.from(context).inflate(R.layout.easy_3d_viewer, null)
        var course3dViewer:Course3DViewer = easy3dView.findViewById<Course3DViewer>(R.id.course3DViewer)
        course3dViewer.viewer.setNavigationModeChangedListener {
            print(it.toString())
        }

        course3dViewer.viewer.setCurrentCourseChangedListener {

        }
        course3dViewer.viewer.setFlyoverFinishListener {

        }
        course3dViewer.viewer.setCurrentHoleChangedListener(object :
            Viewer.CurrentHoleChangedListener {
            override fun onHoleChanged(p0: HoleWithinCourse?) {
                print(p0)
            }

            override fun onHoleFailed() {

            }

        })
        
        if (args != null) {
            val data = args as Map<String, Any>
            val hiddenControlView = data["hiddenControlView"] as Boolean?
        }

        return course3dViewer
    }


}