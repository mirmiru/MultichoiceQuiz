//
//  QuizObject.h
//  Labb2_Quiz
//
//  Created by Milja Virtanen on 2018-01-27.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizObject : NSObject
@property (nonatomic) NSMutableArray *allQuestions;
@property (nonatomic) NSMutableArray *askedQuestions;
@property (nonatomic) int questionNumber;
@property (nonatomic) int correctAnswers;

//Methods
-(instancetype)initQuiz;
-(NSDictionary*)getRandomQuestion;
-(NSArray*)getAnswers:(NSDictionary*)dictionary;
-(BOOL)correctAnswer:(NSDictionary*)dictionary answer:(NSString*)answer;
@end

