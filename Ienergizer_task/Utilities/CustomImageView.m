#import "CustomImageView.h"
#import "ImageCache.h"
#import "APIService.h"

@interface CustomImageView ()

@property (nonatomic, strong) APIService *appServerClient;

@end
  
@implementation CustomImageView

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

- (void)loadImageWithStringURL:(NSString *) urlString {

    self.imageURL = urlString;
    self.appServerClient = [[APIService alloc] init];

    self.image = nil;
    
    if([[ImageCache.sharedManager cache] objectForKey:urlString]) {
        self.image = [[ImageCache.sharedManager cache] objectForKey:urlString];
        return;
    }
    
    [self.appServerClient fetchImageData: urlString completion:^(UIImage * returnImage) {
        
        if (self.imageURL == urlString) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = returnImage;
            });
        }
        
        [[ImageCache.sharedManager cache] setObject:returnImage forKey:urlString];
    }];
}

@end
