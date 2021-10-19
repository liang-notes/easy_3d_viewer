//
//  CourseRenderView.h
//  iGolfViewer3D
//
//  Created by Yevhen Paschenko on 4/11/17.
//  Copyright © 2017 Yevhen Paschenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <CoreLocation/CoreLocation.h>
#import "OpenGLESRenderView.h"
#import "NavigationMode.h"
#import "CalloutsDrawMode.h"
#import "MeasurementSystem.h"
#import "TextureQuality.h"
#import "V3DShape.h"
#import "CourseRenderViewLoader.h"
#import "IGolfPace.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CourseRenderViewDataSource <NSObject>

-(NSArray<V3DShape*>*)renderViewShapesForHole:(NSUInteger)hole;

@end

@protocol CourseRenderViewDelegate <NSObject>

@optional

- (void)courseRenderViewFlyoverFinished;
- (void)courseRenderViewDidChangeNavigationMode:(NavigationMode)navigationMode;
- (void)courseRenderViewDidLoadCourseData;
- (void)courseRenderViewDidLoadHoleData;
- (void)courseRenderViewDidUpdateRoundTime:(NSTimeInterval)roundTime;
- (void)courseRenderViewDidUpdateFlagScreenPoint:(CGPoint)point;
- (void)courseRenderViewDidReceiveTapAtLocation:(CLLocation *)location;
- (void)courseRenderViewDidUpdateTotalRoundTime:(NSTimeInterval)roundTime;
- (void)courseRenderViewDidUpdateCurrentHole:(NSUInteger)currentHole;
- (void)courseRenderViewDidUpdateHoleWithin:(NSUInteger)holeWithin;
- (void)courseRenderViewDidUpdateDistancesToFrontGreen:(double)frontGreen
                                         toCenterGreen:(double)centerGreen
                                           toBackGreen:(double)backGreen;
- (void)courseRenderViewDidUpdateCurrentHole:(NSUInteger)currentHole holeWithin:(NSUInteger)holeWithin isWithinCourse:(BOOL)isWithinCourse;
- (void)courseRenderViewDidFailWithError:(NSError *)error;

@end

@interface CourseRenderView: OpenGLESRenderView<UIGestureRecognizerDelegate>

@property (class, readonly) NSNotification* navigationModeDidChangeNotification;
@property (class, readonly) NSNotification* flyoverFinishedNotification;
@property (class, readonly) NSNotification* didLoadCourseDataNotification;
@property (class, readonly) NSNotification* didLoadHoleDataNotification;
@property (class, readonly) NSNotification* courseRenderViewReleasedNotification;

@property (nonatomic, assign)   NSUInteger currentHole;
@property (nonatomic, readonly) NSUInteger numberOfHoles;
@property (nonatomic, readonly) NSUInteger holeWithin;
@property (nonatomic, readonly) NSTimeInterval roundTime;

@property (nonatomic, retain) CLLocation* currentLocation;

@property (nonatomic, assign)   BOOL showCalloutOverlay;
@property (nonatomic, assign)   BOOL showCartGpsPosition;
@property (nonatomic, assign)   BOOL autozoomActive;
@property (nonatomic, assign)   BOOL shouldSendFlagScreenPointCoordinate;
@property (nonatomic, readonly) BOOL usesOverridedPinPosition;

@property (nonatomic, readonly) CGPoint flagScreenPoint;

@property (nonatomic, assign)   MeasurementSystem measurementSystem;
@property (nonatomic, assign)   NavigationMode navigationMode;
@property (nonatomic, assign)   NavigationMode initialNavigationMode;
@property (nonatomic, assign)   CalloutsDrawMode calloutsDrawMode;

@property (nonatomic, assign)   double overallHoleViewAngle;
@property (nonatomic, assign)   double flyoverViewAngle;
@property (nonatomic, assign)   double freeCamViewAngle;

@property (nonatomic, readonly) CLLocation* flagLocation;

@property (nonatomic, weak) id <CourseRenderViewDelegate> delegate;
@property (nonatomic, weak) id <CourseRenderViewDataSource> dataSource;

-(void)loadWithLoader:(CourseRenderViewLoader *)loader;

-(void)    loadCourseWithId:(NSString*)idCourse
             referralAppKey:(NSString*)referralAppKey
              gpsVectorData:(NSDictionary *)gpsVectorData
             gpsDetailsData:(NSArray *)gpsDetailsData
                    parData:(NSArray *)parData
              elevationData:(nullable NSDictionary *)elevationData
               pinPositions:(nullable NSArray *)pinPositions
             textureQuality:(TextureQuality)textureQuality
           calloutsDrawMode:(CalloutsDrawMode)calloutsDrawMode
        showCalloutsOverlay:(BOOL)showCalloutOverlay
          measurementSystem:(MeasurementSystem)measurementSystem
      initialNavigationMode:(NavigationMode)navigationMode
     cartGpsPositionVisible:(BOOL)isVisible;

- (void)setDrawingEnabled:(BOOL)isEnabled;
- (void)dataSourceChanged;
- (void)setPaceLibrary:(IGolfPace *)paceLibrary;
- (void)setUserFirstName:(nullable NSString*)firstName lastName:(nullable NSString*)lastName email:(nullable NSString*)email idUser:(nullable NSNumber*)idUser;
- (void)setSimulatedLocation:(CLLocation *)simulatedLocation;
- (void)invalidate;

@end

NS_ASSUME_NONNULL_END
