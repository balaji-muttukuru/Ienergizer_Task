#import "NewsListViewModel.h"
#import "APIService.h"
#import "Constants.h"

@interface NewsListViewModel ()

@property (nonatomic, strong) APIService *appServerClient;

@end


@implementation NewsListViewModel

- (instancetype)initWithAppServerClient:(APIService *)appServerClient {
    self = [super init];
    if (self) {
        if (appServerClient) {
            self.appServerClient = appServerClient;
        } else {
            self.appServerClient = [[APIService alloc] init];
        }
    }
    return self;
}

- (void)fetchNews:(NSString *)searchStr completion: (void (^)(NSMutableArray*, NSString*))callback {
    self.appServerClient = [[APIService alloc]init];

    self.searchString = staticSearchString;
  
    dispatch_group_t group = dispatch_group_create();
    self.size = 100;
    self.pageNumber = 1;
    dispatch_group_enter(group);
    [self.appServerClient fetchNews:@"relevancy" withSearchString:searchStr withSize:self.size withPage:self.pageNumber completion:^(NSMutableArray *news, NSString *errorMessage) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (![errorMessage isEqual: @""]) {
                callback(nil, errorMessage);// if failure in response
            }
            else {
                if (news != nil) { // if news object is empty means no response in API call
                    if (self.articles == nil) {
                        self.articles = news;
                    }
                    else {
                        [self.articles addObjectsFromArray:news];
                    }
                }
            }
            callback(self.articles, @"");

        });
    }];
    callback(nil, @"");
}

- (NSUInteger)numberOfNewsInSection:(NSInteger)section {
    return self.articles.count;
}

- (NSString *)fullNameAtIndexPath:(NSIndexPath *)indexPath {
    Article *person = [self personAtIndexPath:indexPath];
    return [NSString stringWithFormat:@"%@", person.title];
}

- (Article *)personAtIndexPath:(NSIndexPath *)indexPath {
    return self.articles[indexPath.row];
}
@end
