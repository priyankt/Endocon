//
//  ECWebService.h
//  Endocon
//
//  Created by Mahavir Jain on 05/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "MKNetworkEngine.h"

typedef void (^IDBlock)(id object);

@interface ECWebService : MKNetworkEngine

// GET WEEKLY QUIZ
- (MKNetworkOperation *) getWeeklyQuizWithCompletionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock;

// SUBMIT ANSWER
- (MKNetworkOperation *) sendAnswerForQuestion:(NSNumber *)qid answer:(NSString *)answer userId:(NSNumber *)userId userEmail:(NSString *)userEmail completionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock) errorBlock;

// SEND SUGGESTION
- (MKNetworkOperation *) sendSuggestionFrom:(NSString *)name email:(NSString *)email phone:(NSString *)phone city:(NSString *)city text:(NSString *)text completionHandler:(IDBlock) completionBlock errorHandler:(MKNKErrorBlock)errorBlock;

// GET WEEKLY WINNER
- (MKNetworkOperation *) getWinnerWithCompletionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock;

// LOGIN
- (MKNetworkOperation *) loginWithUsername:(NSString *)username password:(NSString *)password completionHandler:(IDBlock) completionBlock errorHandler:(MKNKErrorBlock) errorBlock;


// SIGNUP
- (MKNetworkOperation *) signupWithName:(NSString *)name email:(NSString *)email password:(NSString *)password phone:(NSString *)phone city:(NSString *)city   completionHandler:(IDBlock) completionBlock errorHandler:(MKNKErrorBlock) errorBlock;

// NEWS
- (MKNetworkOperation *) getNewsWithCompletionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock;

@end
