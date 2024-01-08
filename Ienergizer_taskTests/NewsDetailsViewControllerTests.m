#import <XCTest/XCTest.h>
#import "NewsDetailsViewController.h"

@interface NewsDetailsViewControllerTests : XCTestCase
@property(nonatomic, strong) NewsDetailsViewController *viewController;

@end

@implementation NewsDetailsViewControllerTests

- (void)setUp {
    self.viewController = [[NewsDetailsViewController alloc]init];
}

- (void)tearDown {
    self.viewController = nil;
}

- (void)testIsViewdidLoad {
    [self.viewController viewDidLoad];
}

- (void)testIsSetDataCalled {
    XCTAssertNil(self.viewController.lblTitle);
    XCTAssertNil(self.viewController.lblDescription);
    XCTAssertNil(self.viewController.lblDate);
    XCTAssertNil(self.viewController.lblAuthor);
    XCTAssertNil(self.viewController.btnMoreDetails);

}


@end
