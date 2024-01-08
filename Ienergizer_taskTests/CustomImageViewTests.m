#import <XCTest/XCTest.h>
#import "CustomImageView.h"

@interface CustomImageViewTests : XCTestCase
@property(nonatomic, strong) CustomImageView *imageview;

@end

@implementation CustomImageViewTests

- (void)setUp {
    self.imageview = [CustomImageView alloc];
}

- (void)tearDown {
    self.imageview = nil;
}

- (void)testImageExample {
    [self.imageview loadImageWithStringURL:@"https://picsum.photos/200/300"];
    XCTAssertNotNil(self.imageview.imageURL);
}

@end
