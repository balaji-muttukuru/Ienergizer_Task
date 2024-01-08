#import <Foundation/Foundation.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface Article : NSObject

//@property (nonatomic, strong) Source *source;
@property (nonatomic, copy)   NSString *author;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *theDescription;
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, copy)   NSString *urlToImage;
@property (nonatomic, copy)   NSString *publishedAt;
@property (nonatomic, copy)   NSString *content;

@end

NS_ASSUME_NONNULL_END
