//
//  CourseDataLoader.h
//  iGolfViewer3D
//
//  Created by Dmitry Klenov on 11/03/2019.
//  Copyright © 2019 Yevhen Paschenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationMode.h"
#import "TextureQuality.h"
#import "CalloutsDrawMode.h"
#import "MeasurementSystem.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CourseRenderView;

@interface CourseRenderViewLoader : NSObject

@property (nonatomic, readonly) NSDictionary* courseGPSVectorDetailsResponse;
@property (nonatomic, readonly) NSDictionary* courseGPSDetailsResponse;
@property (nonatomic, readonly) NSDictionary* courseScorecardDetailsResponse;
@property (nonatomic, readonly) NSDictionary* coursePinPositionDetailsResponse;
@property (nonatomic, readonly) NSDictionary* courseElevationDataDetailsResponse;
@property (nonatomic, readonly) NSDictionary* courseElevationDataDetails;
@property (nonatomic, assign) NSUInteger hole;
@property (nonatomic, assign) BOOL showCalloutOverlay;
@property (nonatomic, assign) BOOL isCartGPSPositionVisible;
@property (nonatomic, assign) BOOL isUserGenderMale;
@property (nonatomic, assign) NavigationMode initialNavigationMode;
@property (nonatomic, assign) TextureQuality textureQuality;
@property (nonatomic, assign) CalloutsDrawMode calloutsDrawMode;
@property (nonatomic, assign) MeasurementSystem measurementSystem;


-(id)initDevLoaderWithApplicationAPIKey:(NSString *)applicationAPIKey
                   applicationSecretKey:(NSString *)applicationSecretKey
                               idCourse:(NSString *)idCourse;

-(id)initWithApplicationAPIKey:(NSString *)applicationAPIKey
          applicationSecretKey:(NSString *)applicationSecretKey
                      idCourse:(NSString *)idCourse;

-(void)preloadWithCompletionHandler:(void (^)())completionHandler
                       errorHandler:(void (^)(NSError * _Nullable error))errorHandler;

-(void)loadForRenderView:(CourseRenderView*)renderView
       completionHandler:(void (^)())completionHandler
            errorHandler:(void (^)(NSError * _Nullable error))errorHandler;

-(void)setLoadingView:(nullable UIView *)view;

-(UIView*)getLoadingView;

@end

NS_ASSUME_NONNULL_END
