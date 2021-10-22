import UIKit
import GLKit
import Flutter

class Easy3dViewerController: GLKViewController, UIGestureRecognizerDelegate {
    
    private lazy var context: EAGLContext! = {
        return EAGLContext(api: .openGLES3)
    }()
    
    weak var channel: FlutterMethodChannel?
    private var renderView: CourseRenderView!
    private var isLoaded: Bool = false
    private var loader: CourseRenderViewLoader!
    var holeNum: UInt = 1
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    private func setupRenderView() {
        renderView = CourseRenderView(frame: view.bounds)
        view.addSubview(renderView)
        renderView.layer.frame = view.bounds
        view.layer.addSublayer(renderView.layer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let glkView = self.view as! GLKView
        glkView.context = context
        EAGLContext.setCurrent(self.context)
        
        setupRenderView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if !self.isLoaded {
            self.load()
        }
    }
    
    override public func glkView(_ view: GLKView, drawIn rect: CGRect) {
        glClearColor(0, 0, 0, 0)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))
        if (renderView != nil) {
            renderView.dataSourceChanged()
        }
    }
    
    deinit {
        if EAGLContext.current() === context {
            EAGLContext.setCurrent(nil)
        }
        context = nil
        renderView = nil
    }
    
    @objc func fly() {
        renderView.setUserFirstName("ss", lastName: "sss", email: nil, idUser: 10)
        if holeNum >= 18 {
            holeNum = 1
        } else {
            holeNum += 1
        }
        renderView.currentHole = holeNum
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "需要定位权限",
                                                message: "用于提高精确的定位及导航服务", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "暂不设置", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "去设置", style: .default, handler: {
            action in
            print("点击了确定")
            //跳到定位设置
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func load() {
        isLoaded = true
        // 设置渲染图层的大小
        //        renderView.layer.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        loader = CourseRenderViewLoader(applicationAPIKey: "FJrRy35GgussGB0", // Enter your applicationAPIKey
                                        applicationSecretKey: "wLkxqcNasM-hy251fWKiPi3wtab789", // Enter your applicationSecretKey
                                        idCourse: "HkDYyWSIHZre") // Enter any id_course you need
        //范围线 默认开启true
        loader.showCalloutOverlay = true
        loader.isCartGPSPositionVisible = true
        loader.isUserGenderMale = false
        loader.textureQuality = TextureQuality.mediumLow
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
        renderView.dataSource = self
        renderView.shouldSendFlagScreenPointCoordinate = true
        renderView.showCalloutOverlay = false
        renderView.calloutsDrawMode = .twoSegments
        
        renderView.currentLocation = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 28.078109346852397, longitude: -82.59316976320997), altitude: 0.0, horizontalAccuracy: 0.0, verticalAccuracy: -1, course: -1, speed: -1, timestamp: Date())
        renderView.currentHole = holeNum
    }
    
}

extension Easy3dViewerController: CourseRenderViewDelegate, CourseRenderViewDataSource {
    func renderViewShapes(forHole hole: UInt) -> [V3DShape] {
        let location1 = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 28.078109346852397, longitude: -82.59316976320997), altitude: 0.0, horizontalAccuracy: 0.0, verticalAccuracy: -1, course: -1, speed: -1, timestamp: Date())
        
        let location2 = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 28.07904152, longitude: -82.59354562), altitude: 0.0, horizontalAccuracy: 0.0, verticalAccuracy: -1, course: -1, speed: -1, timestamp: Date())
        
        let location3 = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 28.07850069, longitude: -82.59341481), altitude: 0.0, horizontalAccuracy: 0.0, verticalAccuracy: -1, course: -1, speed: -1, timestamp: Date())
        
        let location4 = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 28.07928245, longitude: -82.59275245), altitude: 0.0, horizontalAccuracy: 0.0, verticalAccuracy: -1, course: -1, speed: -1, timestamp: Date())
        
        let c1 = V3DCircle.init(location: location1, radius: 10, fill: UIColor.green, borderColor: UIColor.yellow, borderWidth: 2)
        let c2 = V3DCircle.init(location: location2, radius: 10, fill: UIColor.blue, borderColor: UIColor.yellow, borderWidth: 2)
        let c3 = V3DCircle.init(location: location3, radius: 10, fill: UIColor.blue, borderColor: UIColor.yellow, borderWidth: 2)
        
        let c4 = V3DCircle.init(location: location4, radius: 10, fill: UIColor.blue, borderColor: UIColor.yellow, borderWidth: 2)
        
        let l1 = V3DLine.init(start: location1, end: location2, color: UIColor.purple, width: 5)
        let l2 = V3DLine.init(start: location2, end: location3, color: UIColor.purple, width: 5)
        let pg1 = V3DPolygon.init(locations: [location1,location2,location3,location4], fill: UIColor.orange, borderColor: UIColor.white, borderWidth: 2, interpolate: true)
        let pl1 = V3DPolyline.init(locations: [location1,location2,location3,location4], color: UIColor.black, width: 2, interpolate: true)
        return [pg1,c1,c2,c3,c4,l1,l2,pl1]
    }
    
    func courseRenderViewDidLoadCourseData() {
        let button = UIButton(frame: CGRect(x: 10, y: 40, width: 50, height: 50))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(fly), for: .touchUpInside)
        
        
        let button2 = UIButton(frame: CGRect(x: 300, y: 40, width: 50, height: 50))
        button2.backgroundColor = UIColor.orange
        button2.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        renderView.addSubview(button)
        renderView.addSubview(button2)
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

