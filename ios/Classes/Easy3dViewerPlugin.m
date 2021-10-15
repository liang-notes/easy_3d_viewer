#import "Easy3dViewerPlugin.h"
#if __has_include(<easy_3d_viewer/easy_3d_viewer-Swift.h>)
#import <easy_3d_viewer/easy_3d_viewer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "easy_3d_viewer-Swift.h"
#endif

@implementation Easy3dViewerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEasy3dViewerPlugin registerWithRegistrar:registrar];
}
@end
