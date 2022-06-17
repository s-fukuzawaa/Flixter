//
//  TrailerViewController.h
//  Flixter
//
//  Created by Airei Fukuzawa on 6/16/22.
//

#import <UIKit/UIKit.h>
#import <YTPlayerView.h>


NS_ASSUME_NONNULL_BEGIN

@interface TrailerViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSDictionary *detailDict;
@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@end

NS_ASSUME_NONNULL_END
