//
//  Quiz.h
//  Labb2_Quiz
//
//  Created by Milja Virtanen on 2018-01-24.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property (nonatomic) NSDictionary *question;

-(void)questionsData;
-(int)randomQuestion:(NSArray*)questions;

@end
