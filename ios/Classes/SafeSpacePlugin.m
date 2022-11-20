#import "SafeSpacePlugin.h"
#if __has_include(<safe_space_plugin/safe_space_plugin-Swift.h>)
#import <safe_space_plugin/safe_space_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "safe_space_plugin-Swift.h"
#endif

@implementation SafeSpacePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSafeSpacePlugin registerWithRegistrar:registrar];
}
@end
