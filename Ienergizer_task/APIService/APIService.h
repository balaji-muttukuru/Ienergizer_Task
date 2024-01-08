#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// Class to manage API calls
@interface APIService : NSObject

/// Base URL
@property NSString *const urlBase;


- (void) fetchNews:(NSString *)sortBy withSearchString:(NSString *)search withSize:(NSInteger)pageSize withPage:(NSInteger)page completion: (void (^)(NSMutableArray*, NSString*))callback;


-(void) fetchImageData:(NSString* )imageURL completion:(void (^)(UIImage *))callback;
@property (nonatomic, strong) NSObject *result;


@end

NS_ASSUME_NONNULL_END
