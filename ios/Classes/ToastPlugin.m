#import "ToastPlugin.h"
#import <toast/toast-Swift.h>

@implementation ToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftToastPlugin registerWithRegistrar:registrar];
}
@end
