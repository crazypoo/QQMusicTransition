//
//  ViewController.m
//  QQMusicTransition
//
//  Created by zangqilong on 15/3/23.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "TransitionFromSecondToFirst.h"
#import "TransitionFromFirstToSecond.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionFromFirstToSecond alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[TransitionFromSecondToFirst alloc] init];
}

- (IBAction)presentSecond:(id)sender
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *sec = [story instantiateViewControllerWithIdentifier:@"secondStory"];
    sec.transitioningDelegate = self;
    [self presentViewController:sec animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
