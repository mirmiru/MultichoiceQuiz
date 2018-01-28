//
//  ViewController.m
//  Labb2_Quiz
//
//  Created by Milja Virtanen on 2018-01-24.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "ViewController.h"
#import "Quiz.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Quiz *quiz = [[Quiz alloc] init];
    [quiz questionsData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
