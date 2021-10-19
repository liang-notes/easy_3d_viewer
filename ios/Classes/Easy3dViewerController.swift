import UIKit
import GLKit
import Flutter

class Easy3dViewerController: UIViewController {
    
    weak var channel: FlutterMethodChannel?
    
    private var renderView: CourseRenderView!
    
    private var isLoaded: Bool = false
    private var loader: CourseRenderViewLoader!
    var holeNum: UInt = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderView = CourseRenderView.init(frame: view.bounds)
        renderView.layer.bounds = view.bounds
        renderView.backgroundColor = UIColor.blue
        view.layer.addSublayer(renderView.layer)
        view.addSubview(renderView)
        
        if !isLoaded {
            load()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        if !isLoaded {
//            load()
//        }
    }
    
    func load() {
        isLoaded = true
        // 设置渲染图层的大小
//        renderView.layer.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        loader = CourseRenderViewLoader(applicationAPIKey: "FJrRy35GgussGB0", // Enter your applicationAPIKey
                                        applicationSecretKey: "wLkxqcNasM-hy251fWKiPi3wtab789", // Enter your applicationSecretKey
                                        idCourse: "HkDYyWSIHZre") // Enter any id_course you need
        //范围线 默认开启true
        loader.showCalloutOverlay = false
        loader.isCartGPSPositionVisible = false
        loader.isUserGenderMale = false
        if #available(iOS 13.0, *) {
            let loadingView = UIActivityIndicatorView(style: .large)
            loadingView.color = .orange
            loadingView.startAnimating()
            loader.setLoading(loadingView)
        } else {
            // Fallback on earlier versions
        }
       
        //带loading 渲染方式
        renderView.load(with: loader)
        renderView.delegate = self
        
        renderView.shouldSendFlagScreenPointCoordinate = true
        renderView.showCalloutOverlay = false
        
//        renderView.calloutsDrawMode = .oneSegment
//        renderView.currentLocation = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 28.078109346852397, longitude: -82.59316976320997), altitude: 0.0, horizontalAccuracy: 0.0, verticalAccuracy: -1, course: -1, speed: -1, timestamp: Date())
//        renderView.currentHole = holeNum
    }
    
}

extension Easy3dViewerController: CourseRenderViewDelegate {
    
    
    func courseRenderViewDidLoadCourseData() {

        let button = UIButton(frame: CGRect(x: 10, y: 40, width: 50, height: 50))
        button.backgroundColor = UIColor.red
//        button.addTarget(self, action: #selector(fly), for: .touchUpInside)
        renderView.addSubview(button)
    }

    
    func courseRenderViewDidChange(_ navigationMode: NavigationMode) {
//        print("1 courseRenderViewDidChange \(navigationMode.rawValue)")
    }
    
    func courseRenderViewDidLoadHoleData() {
        print("2 courseRenderViewDidLoadHoleData")
    }
    
    func courseRenderViewDidUpdateCurrentHole(_ currentHole: UInt) {
//        print("3 courseRenderViewDidUpdateCurrentHole \(currentHole)")
        //        print(loader.courseScorecardDetailsResponse)
        //        print(loader.coursePinPositionDetailsResponse)
    }
    
    func courseRenderViewFlyoverFinished() {
        print("courseRenderViewFlyoverFinished")
        
    }
    
    func courseRenderViewDidFailWithError(_ error: Error) {
        print("courseRenderViewDidFailWithError \(error)")
    }
    
    //点击球场的时候调用
    func courseRenderViewDidReceiveTap(at location: CLLocation) {
        print("courseRenderViewDidReceiveTap \(location)")
//        renderView.currentLocation = location
//        renderView.dataSourceChanged()
    }
    
    func courseRenderViewDidUpdateHole(within holeWithin: UInt) {
        print("courseRenderViewDidUpdateHole \(holeWithin)")
    }
    
    func courseRenderViewDidUpdateRoundTime(_ roundTime: TimeInterval) {
        print("courseRenderViewDidUpdateRoundTime \(roundTime)")
    }
    
    func courseRenderViewDidUpdateDistances(toFrontGreen frontGreen: Double, toCenterGreen centerGreen: Double, toBackGreen backGreen: Double) {
        print("courseRenderViewDidUpdateDistances \(frontGreen) \(centerGreen) \(backGreen)")
    }
    
    func courseRenderViewDidUpdateFlagScreenPoint(_ point: CGPoint) {
        print("courseRenderViewDidUpdateFlagScreenPoint \(point)")
    }
    
    func courseRenderViewDidUpdateTotalRoundTime(_ roundTime: TimeInterval) {
        print("courseRenderViewDidUpdateTotalRoundTime \(roundTime)")
    }
    
    func courseRenderViewDidUpdateCurrentHole(_ currentHole: UInt, holeWithin: UInt, isWithinCourse: Bool) {
        print("courseRenderViewDidUpdateCurrentHole \(currentHole) \(holeWithin) \(isWithinCourse)")
    }
    
}

