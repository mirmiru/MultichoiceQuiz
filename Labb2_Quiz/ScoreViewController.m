//
//  ScoreViewController.m
//  Labb2_Quiz
//
//  Created by Milja Virtanen on 2018-01-28.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "ScoreViewController.h"
#import "QuizViewController.h"

@interface ScoreViewController ()
@property (weak, nonatomic) IBOutlet UITextField *correctAnswersField;
@property (weak, nonatomic) IBOutlet UITextField *wrongAnswersField;

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wrongAnswers = 10-(self.correctAnswers);
    self.correctAnswersField.text = [NSString stringWithFormat:@"%d", self.correctAnswers];
    self.wrongAnswersField.text = [NSString stringWithFormat:@"%d", self.wrongAnswers];
    // Do any additional setup after loading the view.
    
}
- (IBAction)playAgainButton:(id)sender {
    QuizViewController *quiz = [[QuizViewController alloc] init];
    [quiz viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
