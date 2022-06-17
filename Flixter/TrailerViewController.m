//
//  TrailerViewController.m
//  Flixter
//
//  Created by Airei Fukuzawa on 6/16/22.
//

#import "TrailerViewController.h"

@interface TrailerViewController ()

@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *appended = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@/videos?api_key=8c8bccd040d41bddd2358e51db3cc347&language=en-US", self.detailDict[@"id"]];

    NSURL *url = [NSURL URLWithString:appended];
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
               if(dataDictionary[@"results"]){
                   NSDictionary *first =dataDictionary[@"results"][0];
                   
                   if([first[@"site"] isEqualToString:@"YouTube"]){
                       NSString *key = first[@"key"];
                       [self.playerView loadWithVideoId:key];
                       [self.playerView playVideo];
                       
                   }else{
                       UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Trailer not on YouTube"
                                   message:@"Yikes!"
                                   preferredStyle:UIAlertControllerStyleActionSheet];
                           UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                       NSLog(@"User pressed");
                                   }];
                           
                       [alert addAction:action];
                        
                           [self presentViewController:alert animated:YES completion:nil];
                   }
               }
               
               
               // TODO: Store the movies in a property to use elsewhere
               // TODO: Reload your table view data
           }
       }];
    [task resume];
    
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
