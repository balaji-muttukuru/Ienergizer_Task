#import <XCTest/XCTest.h>
#import "NewsListViewModel.h"
#import "Article.h"
#import "NewsListViewController.h"
#import "Constants.h"

@interface NewsListViewModelTests : XCTestCase
@property(nonatomic, strong) Article *article;
@property(nonatomic, strong) News *news;
@property(nonatomic, strong) Constants *constants;
@property(nonatomic, strong) NewsListViewController *listView;
@property(nonatomic, strong) APIService *apiService;

@end

@implementation NewsListViewModelTests

- (void)setUp {
    [super setUp];
    self.article = [[Article alloc] init];
    self.news = [[News alloc] init];
    self.constants = [[Constants alloc] init];
    self.listView = [[NewsListViewController alloc] init];
    self.apiService = [[APIService alloc] init];

}

- (void)tearDown {
    self.article = nil;
    self.news = nil;
    self.constants = nil;
    self.listView = nil;
    self.apiService = nil;
}

- (void)testViewModelReturnsPeopleCount {
    NewsListViewModel *viewModel = [NewsListViewModel alloc];
    XCTAssertEqual([viewModel numberOfNewsInSection:0], 0);
}

- (void)testTilte {
    NewsListViewModel *viewModel = [NewsListViewModel alloc];
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    XCTAssertNotEqual([viewModel fullNameAtIndexPath:path], @"");
}

- (void)testViewdidLoad {
    [self.listView viewDidLoad];
    XCTAssertEqual(self.listView.isViewLoaded, true);
}

- (void)testApiService {
    [self.listView viewDidLoad];

    XCTAssertEqual(self.listView.isViewLoaded, true);
}

- (void)testInitialLoadScreen {
    NewsListViewModel *viewModel = [NewsListViewModel alloc];
    XCTAssertNotNil([viewModel initWithAppServerClient:self.apiService]);
}


@end
