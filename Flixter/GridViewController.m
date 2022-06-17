//
//  GridViewController.m
//  Flixter
//
//  Created by Airei Fukuzawa on 6/16/22.
//

#import "GridViewController.h"
#import "GridViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"


@interface GridViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *gridView;
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation GridViewController

- (void)viewDidLoad {
    // Start the activity indicator
    [self.activityIndicator startAnimating];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gridView.dataSource = self;
    self.gridView.delegate = self;
    [self fetchMovies];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    [self.gridView insertSubview:self.refreshControl atIndex:0];
}
- (void)fetchMovies {
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=8c8bccd040d41bddd2358e51db3cc347"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network Error!"
                           message:@"Please check your internet connection"
                           preferredStyle:UIAlertControllerStyleActionSheet];
                   UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                               NSLog(@"User pressed");
                           }];
                   
               [alert addAction:action];
                
                   [self presentViewController:alert animated:YES completion:nil];
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//               NSLog(@"%@", dataDictionary);// log an object with the %@ formatter.


               // TODO: Get the array of movies
               self.movies = dataDictionary[@"results"];
               [self.gridView reloadData];
               // TODO: Store the movies in a property to use elsewhere
               // TODO: Reload your table view data
           }
        [self.refreshControl endRefreshing];
       }];
    [task resume];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.movies.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GridViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridViewCell" forIndexPath:indexPath];
    NSDictionary *movie = self.movies[indexPath.row];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = movie[@"poster_path"];
    NSString *fullImgURL = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullImgURL];
    [cell.posterView setImageWithURL:posterURL];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //you'll need to have gotten an index with indexPathForCell
    NSIndexPath *indexPath = [self.gridView indexPathForCell:(GridViewCell *)sender];
    NSDictionary *dataToPass = self.movies[indexPath.row];
    DetailsViewController *detailVC = [segue destinationViewController];
    detailVC.detailDict = dataToPass;
}


@end
