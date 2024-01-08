#import <XCTest/XCTest.h>
#import "NewsListViewModel.h"
#import "Article.h"
#import "NewsListViewController.h"
#import "Constants.h"

@interface  MockAPIService : APIService


@end

@implementation MockAPIService


@end

@interface MockAPIServiceTests : XCTestCase
@property(nonatomic, strong) MockAPIService *apiService;

@end

@implementation MockAPIServiceTests

- (void)setUp {
    self.apiService = [[MockAPIService alloc] init];

}

- (void)tearDown {
    self.apiService = nil;
}

-(void)testCompletionhandler {
    [self.apiService fetchNews:@"relevancy" withSearchString:@"searchStr" withSize:1 withPage:1 completion:^(NSMutableArray *news, NSString *errorMessage) {
        self.apiService.result = news;
    }];
}

-(void)testImageCompletionhandler {
    
    [self.apiService fetchImageData:@"" completion:^(UIImage * returnImage) {
        XCTAssertNotNil(self.apiService.result);
    }];
    
    
}

@end
