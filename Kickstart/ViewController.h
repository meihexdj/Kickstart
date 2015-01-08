//
//  ViewController.h
//  Game
//
//  Created by muweimo on 15/1/6.
//  Copyright (c) 2015年 muweimo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AboutViewController.h"

@interface ViewController : UIViewController <UIAlertViewDelegate>
- (IBAction)sliderMoved:(id)sender;
- (IBAction)startOver:(id)sender;

- (IBAction)showAlert:(id)sender;
@property(weak, nonatomic) IBOutlet UISlider *slider;
@property(weak, nonatomic) IBOutlet UILabel *targetLabel;
@property(weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property(weak, nonatomic) IBOutlet UILabel *roudLable;
- (IBAction)showInfo:(id)sender;

@end
