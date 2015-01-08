//
//  AboutViewController.m
//  Game
//
//  Created by muweimo on 15/1/7.
//  Copyright (c) 2015年 muweimo. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from
  // its nib.
  NSString *htmlFile =
      [[NSBundle mainBundle] pathForResource:@"CrazyDrag" ofType:@"html"];
  NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
  NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];

  [self.webView loadData:htmlData
                MIMEType:@"text/html"
        textEncodingName:@"UTF-8"
                 baseURL:baseURL];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
  //[self.presentingViewController dismissViewControllerAnimated:YES
  // completion:nil];自杀返回上一层界面。

  UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

  UIViewController *game =
      [board instantiateViewControllerWithIdentifier:@"game"];

  game.modalTransitionStyle = UIModalTransitionStylePartialCurl;
  [self presentViewController:game animated:YES completion:nil];
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

@end
