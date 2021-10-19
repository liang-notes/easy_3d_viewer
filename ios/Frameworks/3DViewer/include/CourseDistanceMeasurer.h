//
//  CourseDistanceMeasurer.h
//  iGolfViewer3D
//
//  Created by Dmitry Klenov on 04/03/2019.
//  Copyright © 2019 Yevhen Paschenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "MeasurementSystem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CourseDistanceMeasurerDelegate <NSObject>

@optional

- (void)courseDistanceMeasurerDidUpdateDistancesToFrontGreen:(double)frontGreen
                                               toCenterGreen:(double)centerGreen
                                                 toBackGreen:(double)backGreen;

@end

@interface CourseDistanceMeasurer : NSObject

@property (nonatomic, weak) id <CourseDistanceMeasurerDelegate> delegate;
@property (nonatomic, assign) MeasurementSystem measurementSystem;
@property (nonatomic, retain) CLLocation* currentLocation;
@property (nonatomic, assign) NSUInteger currentHole;

-(id)initWithGPSDetailsData:(NSArray *)gpsDetailsData measurementSystem:(MeasurementSystem)measurementSystem;

@end

NS_ASSUME_NONNULL_END
