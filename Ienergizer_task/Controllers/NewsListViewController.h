#import <UIKit/UIKit.h>
#import "NewsListViewModel.h"

@interface NewsListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NewsListViewModel *listViewModel;
@property (weak, nonatomic) IBOutlet UITableView *newsListTableView;
@property (nonatomic, copy) NSString *searchString;
@property (nonatomic) UIActivityIndicatorView *activityIndicator;

@end


