//
//  DetailsViewController.h
//  Flixter
//
//  Created by Airei Fukuzawa on 6/15/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSDictionary *detailDict;
@property (nonatomic, strong) NSArray *movies;
@end

NS_ASSUME_NONNULL_END
