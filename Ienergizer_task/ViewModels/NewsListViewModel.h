#import <Foundation/Foundation.h>
#import "APIService.h"
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListViewModel : NSObject
@property (nonatomic, strong) NSMutableArray *wordsArray;
@property (nonatomic, strong) APIService *request;
@property (nonatomic, copy) NSString *searchString;
@property (readwrite, assign) NSInteger size;
@property (readwrite, assign) NSInteger pageNumber;
@property (nonatomic) NSMutableArray<Article *> *articles;

- (void)fetchNews:(NSString *)searchStr
       completion: (void (^)(NSMutableArray*, NSString*))callback;

- (NSUInteger)numberOfNewsInSection:(NSInteger)section;
- (NSString *)fullNameAtIndexPath:(NSIndexPath *)indexPath;

- (instancetype)initWithAppServerClient:(APIService *)appServerClient;
@end

NS_ASSUME_NONNULL_END
