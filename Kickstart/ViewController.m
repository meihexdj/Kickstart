//
//  ViewController.m
//  Game
//
//  Created by muweimo on 15/1/6.
//  Copyright (c) 2015年 muweimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int currentValue;
@property int targetValue;
@property int score;
@property int round;
@end

@implementation ViewController
@synthesize slider;
@synthesize targetValue;
@synthesize currentValue;
@synthesize scoreLabel;
@synthesize score;
@synthesize round;

/// 展现游戏结果状态
- (void)updateLabels {
  self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
  self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
  self.roudLable.text = [NSString stringWithFormat:@"%d", round];
}

// 启动前的数据初始化
- (void)startNewRound {
  round += 1;
  targetValue = 1 + (arc4random() % 100);
  currentValue = 50;
  self.slider.value = currentValue;
}
- (void)startNewGame {
  score = 0;
  round = -1;
  [self startNewRound];
}

  // VC的HOOK方法，用于初始化VC
- (void)viewDidLoad {
  [super viewDidLoad];
  //取出图片
  UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
// 设置正常情况下滑块的背景图
  [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];

  //取出图片
  UIImage *thumbImageHighlighted =
      [UIImage imageNamed:@"SliderThumb- Highlighted"];

  // 设置滑动的时候情况下滑块的背景图
  [self.slider setThumbImage:thumbImageHighlighted
                    forState:UIControlStateHighlighted];

  // 取出图片
  UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"]
      stretchableImageWithLeftCapWidth:14
                          topCapHeight:0];
  // 设置左边轨道背景图
  [self.slider setMinimumTrackImage:trackLeftImage
                           forState:UIControlStateNormal];
  // 取出图片
  UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]
      stretchableImageWithLeftCapWidth:14
                          topCapHeight:0];
  // 设置右边轨道背景图
  [self.slider setMaximumTrackImage:trackRightImage
                           forState:UIControlStateNormal];

  [self startNewGame];
  [self updateLabels];

  round = -1;
  [self startNewRound];
  [self updateLabels];
  currentValue = slider.value;
  targetValue = 1 + (arc4random() % 100);
  currentValue = 50;
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(id)sender {
  currentValue = (int)lroundf(slider.value);
}

- (IBAction)startOver:(id)sender {
  [self startNewGame];
  [self updateLabels];
}

- (IBAction)showAlert:(id)sender {

  int difference;
  difference = abs(currentValue - targetValue);
  int points = 100 - difference;
  score = score + points;
  NSString *title;

  if (difference == 0) {
    title = @"你太NB了!简直就是银神啊！";

    points += 100;
  } else if (difference < 5) {
    if (difference == 1) {
      points += 50;
    }
    title = @"大银侠太棒了,就差一点变银仙!";
  } else if (difference < 10) {
    title = @"好吧,勉强算个小银侠！";
  } else {
    title = @"你个小银虫少来装!";
  }

  NSString *message = [NSString
      stringWithFormat:
          @"恭喜您！银神封你《淫魔称号》，得分是%d分",
          points];

  [[[UIAlertView alloc] initWithTitle:title
                              message:message
                             delegate:self
                    cancelButtonTitle:@"奴家知道，官人辛苦了！"
                    otherButtonTitles:nil, nil] show];
}

- (void)alertView:(UIAlertView *)alertView
    didDismissWithButtonIndex:(NSInteger)buttonIndex {
  [self startNewRound];
  [self updateLabels];
}

#pragma - mark 实现横屏

- (BOOL)shouldAutorotate {
  return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:
            (UIInterfaceOrientation)toInterfaceOrientation {
  return (toInterfaceOrientation != UIInterfaceOrientationLandscapeLeft);
}

- (NSUInteger)supportedInterfaceOrientations {
  return UIInterfaceOrientationMaskLandscapeLeft;
}
- (IBAction)showInfo:(id)sender {
  AboutViewController *controller =
      [[AboutViewController alloc] initWithNibName:@"AboutViewController"
                                            bundle:nil];
  controller.modalTransitionStyle = UIModalTransitionStylePartialCurl;
  [self presentViewController:controller animated:YES completion:nil];
}

@end
