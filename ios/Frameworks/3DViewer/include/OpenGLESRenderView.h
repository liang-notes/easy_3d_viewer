//
//  OpenGLESRenderView.h
//  iGolfViewer3D
//
//  Created by Yevhen Paschenko on 4/11/17.
//  Copyright © 2017 Yevhen Paschenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAGLContext;

@interface OpenGLESRenderView : UIView

@property (nonatomic, retain) EAGLContext* context;
- (void)tearDown;
- (void)normalizeBuffers;
@end
