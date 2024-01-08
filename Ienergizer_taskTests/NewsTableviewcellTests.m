#import <XCTest/XCTest.h>
#import "NewsTableViewCell.h"

@interface NewsTableviewcellTests : XCTestCase
@property(nonatomic, strong) NewsTableViewCell *cell;

@end

@implementation NewsTableviewcellTests

- (void)setUp {
    self.cell = [[NewsTableViewCell alloc]init];

}

- (void)tearDown {
    self.cell = nil;
}

- (void)testExample {
    [self.cell awakeFromNib];
    XCTAssertNotNil(self.cell.detailTextLabel);
}

@end
