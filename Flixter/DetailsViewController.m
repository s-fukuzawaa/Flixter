//
//  DetailsViewController.m
//  Flixter
//
//  Created by Airei Fukuzawa on 6/15/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TrailerViewController.h"
#import "PosterViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *frontPoster;
@property (weak, nonatomic) IBOutlet UIImageView *backPoster;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.detailDict);
    self.titleLabel.text = self.detailDict[@"title"];
    self.synopsisLabel.text = self.detailDict[@"overview"];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.detailDict[@"poster_path"];
    NSString *fullImgURL = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullImgURL];
    [self.frontPoster setImageWithURL:posterURL];
    [self.backPoster setImageWithURL:posterURL];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //you'll need to have gotten an index with indexPathForCell
    TrailerViewController *trailerVC = [segue destinationViewController];
    trailerVC.detailDict = self.detailDict;
}

@end
