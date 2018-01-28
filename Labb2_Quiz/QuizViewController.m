//
//  QuizViewController.m
//  Labb2_Quiz
//
//  Created by Milja Virtanen on 2018-01-25.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "QuizViewController.h"
#import "QuizObject.h"
#import "ScoreViewController.h"

@interface QuizViewController ()
@property (weak, nonatomic) IBOutlet UITextField *questionNrLabel;
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
@property (weak, nonatomic) IBOutlet UIButton *answer01;
@property (weak, nonatomic) IBOutlet UIButton *answer02;
@property (weak, nonatomic) IBOutlet UIButton *answer03;
@property (weak, nonatomic) IBOutlet UIButton *answer04;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionButton;
@property (weak, nonatomic) IBOutlet UIButton *getScoreButton;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (nonatomic) QuizObject *quiz;
@property (nonatomic) NSArray *answers;
@property (nonatomic) NSDictionary *questionAnswerSet;
@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.continueButton.hidden = YES;
    self.getScoreButton.hidden = YES;
    self.playAgainButton.hidden = YES;
    self.nextQuestionButton.hidden = YES;
    self.quiz = [[QuizObject alloc] initQuiz];
    [self setTexts];
}

- (void)setTexts {
    self.continueButton.hidden = YES;
    self.questionNrLabel.text = [NSString stringWithFormat:@"QUESTION #%d", (self.quiz.questionNumber+1)];
    NSLog(@"CORRECT: %d", self.quiz.correctAnswers);
    NSLog(@"QUESTION NR. %d", self.quiz.questionNumber);
    
    if (self.quiz.questionNumber > 9) {
        NSLog(@"NO QUESTIONS REMAIN.");
        [self quizOver];
    } else {
    self.questionAnswerSet = [self.quiz getRandomQuestion];
    //Get question and set text
    self.questionTextView.text = self.questionAnswerSet[@"question"];
    
    //Get answers and set buttons
    self.answers = [self.quiz getAnswers:self.questionAnswerSet];    
    [self.answer01 setTitle:self.answers[0] forState:UIControlStateNormal];
    [self.answer02 setTitle:self.answers[1] forState:UIControlStateNormal];
    [self.answer03 setTitle:self.answers[2] forState:UIControlStateNormal];
    [self.answer04 setTitle:self.answers[3] forState:UIControlStateNormal];
    }
    
    /*
    if (self.quiz.questionNumber == 5) {
        [self halfwayScore];
    }
     */
}
- (IBAction)pressedButton01:(id)sender {
    NSString *test = self.answer01.currentTitle;
    NSLog(@"%@", test);
    [self showResult:[self.quiz correctAnswer:self.questionAnswerSet answer:test]];
}
- (IBAction)pressedButton02:(id)sender {
    NSString *test = self.answer02.currentTitle;
    NSLog(@"%@", test);
    [self showResult:[self.quiz correctAnswer:self.questionAnswerSet answer:test]];
}
- (IBAction)pressedButton03:(id)sender {
    NSString *test = self.answer03.currentTitle;
    NSLog(@"%@", test);
    [self showResult:[self.quiz correctAnswer:self.questionAnswerSet answer:test]];
}
- (IBAction)pressedButton04:(id)sender {
    NSString *test = self.answer04.currentTitle;
    NSLog(@"%@", test);
    [self showResult:[self.quiz correctAnswer:self.questionAnswerSet answer:test]];
}

- (void)showResult:(BOOL)result {
    if (result) {
        self.questionTextView.text = @"That's right! You got it!";
    } else {
        self.questionTextView.text = @"Hmm, not quite right...";
    }
    [self nextQuestion];
}

- (void)nextQuestion {
    self.answer01.enabled = NO;
    self.answer02.enabled = NO;
    self.answer03.enabled = NO;
    self.answer04.enabled = NO;
    self.nextQuestionButton.hidden = NO;
    self.nextQuestionButton.enabled = YES;
}

- (IBAction)getNextQuestion:(id)sender {
    NSLog(@"Next question");
    [self setTexts];
    self.nextQuestionButton.enabled = NO;
    self.answer01.enabled = YES;
    self.answer02.enabled = YES;
    self.answer03.enabled = YES;
    self.answer04.enabled = YES;
}

/*
- (void)halfwayScore {
    self.questionTextView.text = [NSString stringWithFormat:@"You have answered %d / %d questions correctly.", self.quiz.correctAnswers, 5];
    self.continueButton.hidden = NO;
    self.answer01.hidden = YES;
    self.answer02.hidden = YES;
    self.answer03.hidden = YES;
    self.answer04.hidden = YES;
}
 */

- (IBAction)continuePlaying:(id)sender {
    [self setTexts];
}

- (IBAction)getScore:(id)sender {
}

- (void)quizOver {
    self.questionNrLabel.text = [NSString stringWithFormat:@"DONE"];
    self.questionTextView.text = [NSString stringWithFormat:@"You've answered all questions. Click to see your score."];
    self.answer01.hidden = YES;
    self.answer02.hidden = YES;
    self.answer03.hidden = YES;
    self.answer04.hidden = YES;
    self.nextQuestionButton.hidden = YES;
    self.getScoreButton.hidden = NO;
    //self.playAgainButton.hidden = NO;
}

- (IBAction)playAgain:(id)sender {
    //TODO: Reset and allow new round.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"getScoreSegue"]) {
        ScoreViewController *scoreView = [segue destinationViewController];
        scoreView.correctAnswers = self.quiz.correctAnswers;
    }
}

@end
