//
//  PosterViewController.m
//  Flixter
//
//  Created by Airei Fukuzawa on 6/17/22.
//

#import "PosterViewController.h"
#import "UIImageView+AFNetworking.h"


@interface PosterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;

@end

@implementation PosterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *urlLarge = [NSURL URLWithString:[@"https://image.tmdb.org/t/p/original" stringByAppendingString: self.imgId]];

    [self.posterImage setImageWithURL:urlLarge];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
