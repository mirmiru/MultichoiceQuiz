//
//  QuizObject.m
//  Labb2_Quiz
//
//  Created by Milja Virtanen on 2018-01-27.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "QuizObject.h"

@implementation QuizObject

-(instancetype)initQuiz {
    self = [super init];
    
    if(self) {
        self.correctAnswers = 0;
        
        self.allQuestions = @[
                              @{
                                  @"question": @"House",
                                  @"answers": @{
                                          @"correct": @"Talo",
                                          @"false1": @"Hullu",
                                          @"false2": @"Tuoli",
                                          @"false3": @"Haalis"
                                          }
                                  },
                              @{
                                  @"question": @"Cat",
                                  @"answers": @{
                                          @"correct": @"Kissa",
                                          @"false1": @"Lintu",
                                          @"false2": @"Mummo",
                                          @"false3": @"Maito"
                                          }
                                  },
                              @{
                                  @"question": @"Milk",
                                  @"answers": @{
                                          @"correct": @"Maito",
                                          @"false1": @"Lahja",
                                          @"false2": @"Olut",
                                          @"false3": @"Sauna"
                                          }
                                  },
                              @{
                                  @"question": @"Car",
                                  @"answers": @{
                                          @"correct": @"Auto",
                                          @"false1": @"Pallo",
                                          @"false2": @"Kalja",
                                          @"false3": @"Tuli"
                                          }
                                  },
                              @{
                                  @"question": @"Beer",
                                  @"answers": @{
                                          @"correct": @"Olut",
                                          @"false1": @"Vesi",
                                          @"false2": @"Pöytä",
                                          @"false3": @"Sänky"
                                          }
                                  },
                              @{
                                  @"question": @"Keys",
                                  @"answers": @{
                                          @"correct": @"Avaimet",
                                          @"false1": @"Kirja",
                                          @"false2": @"Laukku",
                                          @"false3": @"Leipä"
                                          }
                                  },
                              @{
                                  @"question": @"Coat",
                                  @"answers": @{
                                          @"correct": @"Takki",
                                          @"false1": @"Saapas",
                                          @"false2": @"Tasku",
                                          @"false3": @"Hattu"
                                          }
                                  },
                              @{
                                  @"question": @"Door",
                                  @"answers": @{
                                          @"correct": @"Ovi",
                                          @"false1": @"Hana",
                                          @"false2": @"Sytkäri",
                                          @"false3": @"Ikkuna"
                                          }
                                  },
                              @{
                                  @"question": @"Phone",
                                  @"answers": @{
                                          @"correct": @"Puhelin",
                                          @"false1": @"Televisio",
                                          @"false2": @"Roskis",
                                          @"false3": @"Jääkaappi"
                                          }
                                  },
                              @{
                                  @"question": @"Salad",
                                  @"answers": @{
                                          @"correct": @"Salaatti",
                                          @"false1": @"Kala",
                                          @"false2": @"Pottu",
                                          @"false3": @"Maito"
                                          }
                                  }
                              ].mutableCopy;
    }
    return self;
}

-(void)shuffleQuestions {
    int count = (int)[self.allQuestions count];
    if (count==1) {
        NSLog(@"Last question");
        return;
    }
    for (int i = 0; i < count-1; i++) {
        int remainingQuestions = count - i;
        int newIndex = i + arc4random_uniform(remainingQuestions);
        [self.allQuestions exchangeObjectAtIndex:i withObjectAtIndex:newIndex];
    }
}

-(NSDictionary*)getRandomQuestion {
    self.questionNumber++;
    //Shuffle all questions
    [self shuffleQuestions];
    //Get first question in array
    NSDictionary *dictionary = self.allQuestions[0];
    //Remove from array
    [self.allQuestions removeObjectAtIndex:0];
    return dictionary;
}


-(NSArray*)getAnswers:(NSDictionary*)dictionary {
    NSArray *answers = [dictionary[@"answers"] allValues];
    NSMutableArray *shuffledAnswers = answers.mutableCopy;
    
    int count = (int)[shuffledAnswers count];
    for (int i = 0; i < count; i++) {
        int remainingQuestions = count - i;
        int newIndex = i + arc4random_uniform(remainingQuestions);
        [shuffledAnswers exchangeObjectAtIndex:i withObjectAtIndex:newIndex];
     }
    return shuffledAnswers;
}

-(BOOL)correctAnswer:(NSDictionary*)dictionary answer:(NSString*)answer {
    NSDictionary *test = dictionary[@"answers"];
    NSArray *array = [test allKeysForObject:answer];
    NSLog(@"ANSWER %@ = %@", answer, array[0]);
    
    if([array[0] isEqualToString:@"correct"]) {
        NSLog(@"Correct");
        [self increaseScore];
        NSLog(@"Correct: %d", self.correctAnswers);
        return YES;
    } else {
        NSLog(@"Incorrect");
        return NO;
    }
}

-(void)increaseScore {
    self.correctAnswers++;
}

@end
