#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Class to store image cache
@interface ImageCache : NSObject

/// Properties
@property (nonatomic, retain) NSCache *cache;

/// shared instance
+ (id)sharedManager;

@end

NS_ASSUME_NONNULL_END
