#import "NewsListViewController.h"
#import "NewsListViewModel.h"
#import "NewsTableViewCell.h"
#import "Constants.h"
#import "NewsDetailsViewController.h"

@interface NewsListViewController ()
@property (nonatomic, strong) APIService *appServerClient;

@end

@implementation NewsListViewController
static NSString *CellIdentifier = @"NewsTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appServerClient = [[APIService alloc] init];

    [self.newsListTableView registerNib:[UINib nibWithNibName:CellIdentifier bundle:nil] forCellReuseIdentifier:CellIdentifier];

    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    _activityIndicator.alpha = 1.0;
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height/2);
    self.listViewModel = [[NewsListViewModel alloc] init];
    self.listViewModel.articles = [[NSMutableArray alloc] init];
    [_activityIndicator startAnimating];
    [self.listViewModel initWithAppServerClient:self.appServerClient];
    [self.listViewModel fetchNews:_searchString completion:^(NSMutableArray *news, NSString *errorMessage){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (![errorMessage isEqual: @""]) { // if failure in response
                [self showAlertMsg:self title:@"Error" message:errorMessage];
            } else{
                [self.activityIndicator stopAnimating];
                self.listViewModel.articles = news;
                [self.newsListTableView reloadData];
            }
        });
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewsDetailsViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"NewsDetailsViewController"];
    controller.news = [self.listViewModel.articles objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle : title
                                                                    message : message
                                                             preferredStyle : UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          { }];
    
    [alert addAction:ok];
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alert animated:YES completion:nil];
    });
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listViewModel numberOfNewsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setData:_listViewModel.articles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.listViewModel.articles.count > 1){ // handle pagination
        if(indexPath.row == self.listViewModel.articles.count - 1) {
            self.listViewModel.pageNumber = self.listViewModel.pageNumber + 1;
            [self.listViewModel fetchNews:_searchString completion:^(NSMutableArray *news, NSString *errorMessage){
                
                if ([errorMessage isEqual: @""]) { // if failure in response
                    [self showAlertMsg:self title:@"Error" message:@"your account is limited to max of 100 results."];
                }
            }];
        }
    }
    
    
}
@end
