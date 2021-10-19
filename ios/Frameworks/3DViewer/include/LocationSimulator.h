//
//  LocationSimulator.h
//  iGolfViewer3D
//
//  Created by Dmitry Klenov on 31/01/2019.
//  Copyright © 2019 Yevhen Paschenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationSimulator : NSObject

-(id)initWithGpsVectorData:(NSDictionary*)gpsVectorData andGPSList:(NSArray*)gpsList andTeesObject:(NSDictionary*)teesObject;
-(CLLocation*)getLocationForHole:(NSUInteger)hole;
-(BOOL)coursePolygonContainsLocation:(CLLocation*)location;

@end

NS_ASSUME_NONNULL_END
