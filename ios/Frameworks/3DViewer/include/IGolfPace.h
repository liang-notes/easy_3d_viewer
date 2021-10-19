//
//  IGolfPace.h
//  IGolfPace
//
//  Created by Dmitry Klenov on 27/05/2019.
//  Copyright © 2019 iGolf. All rights reserved.
//  NEW

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IGolfPace : NSObject

@property (nonatomic, assign) NSUInteger currentHole;
@property (nonatomic, assign) CLLocation* currentLocation;
@property (nonatomic, readonly) NSTimeInterval roundTime;

-(id)initWithIdCourse:(NSString*)idCourse referralAppKey:(NSString*)referralAppKey vectorGPSObject:(NSDictionary*)vectorGPSObject;

- (void)setUserFirstName:(nullable NSString*)firstName lastName:(nullable NSString*)lastName email:(nullable NSString*)email idUser:(nullable NSNumber*)idUser;

-(NSTimeInterval)getPaceForHole:(NSUInteger)holeNumber;

-(void)endRound;

-(void)invalidate;

@end

NS_ASSUME_NONNULL_END
