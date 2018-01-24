//
//  Quiz.m
//  Labb2_Quiz
//
//  Created by Milja Virtanen on 2018-01-24.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

//Set up questions
-(void)questionsData {
    NSArray *questions = @[
                           @{
                               @"question": @"Tree",
                               @"correct": @"Puu",
                               @"false": @{
                                       @"false1": @"Pää",
                                       @"false2": @"Peruna",
                                       @"false3": @"Potis"
                                       },
                               @"asked": @NO
                               },
                           @{
                               @"question": @"Cat",
                               @"correct": @"Kissa",
                               @"false": @{
                                       @"false1": @"Kiisa",
                                       @"false2": @"Kisa",
                                       @"false3": @"Kirra"
                                       },
                               @"asked": @NO
                               }
                           ];
}

//Get random question number
-(int)randomQuestion:(NSArray*)questions {
    return arc4random_uniform((int)[questions count]);
}

//Check if question has been asked
-(BOOL)asked:(NSDictionary*)question {
    BOOL asked = question[@"asked"];
    if(!asked) {
        //NSLog(@"Asked");
        return YES;
    } else {
        //NSLog(@"Not asked");
        return NO;
    }
}

//Check if answer is correct:
/*
    NSDictionary *d = @{@"Q": @"A"};
    NSArray* arrayOfKeys = [d allKeysForObject:@"A"];
    NSString *key = [arrayOfKeys firstObject];
*/
 
//Keys in dictionary's are unique. If you add a second object under an existing key, first key-value gets replaced.
/*
 [friends setObject:betty forKey:@"bestFriend"];    BF -> Betty
 [friends setObject:jane forKet@"bestFriend"];      BF -> Jane
 
 */




@end
