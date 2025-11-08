#import <React/RCTBridgeModule.h>

// Note: Function declarations are not needed since we're using dlsym for dynamic loading
// This allows the code to compile and run even if the library isn't linked (e.g., for simulator builds)

@interface Didcomm : NSObject <RCTBridgeModule>
@end