#import "Didcomm.h"

// Only declare and use functions when not building for simulator
#if !TARGET_IPHONE_SIMULATOR
extern const char* hello_world(void);
extern void free_string(const char* ptr);
#endif

@implementation Didcomm

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(helloWorld:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
#if TARGET_IPHONE_SIMULATOR
    // Library is not available on simulator
    reject(@"LIBRARY_NOT_AVAILABLE", 
           @"Didcomm SDK library is not available on iOS Simulator. This functionality requires a physical iOS device build.", 
           nil);
#else
    // Device build - library is available
    const char* message = hello_world();
    if (message == NULL) {
        reject(@"LIBRARY_ERROR", @"Failed to call hello_world function", nil);
        return;
    }
    
    NSString *messageString = [NSString stringWithUTF8String:message];
    free_string(message);
    resolve(messageString);
#endif
}

@end