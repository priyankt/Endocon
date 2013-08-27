//
//  ECWebService.m
//  Endocon
//
//  Created by Mahavir Jain on 05/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECWebService.h"
#import "ECConstants.h"

@implementation ECWebService
- (MKNetworkOperation *) getWeeklyQuizWithCompletionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:@"api/mgetquestion.php" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSDictionary *quizResponse = [completedOperation responseJSON];
        NSLog(@"%@", quizResponse);
        completionBlock(quizResponse);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
        NSLog(@"%@", error);
        errorBlock(error);
    }];
    
    return op;
}

- (MKNetworkOperation *) sendAnswerForQuestion:(NSNumber *)qid answer:(NSString *)answer userId:(NSNumber *)userId userEmail:(NSString *)userEmail completionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock) errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:@"api/maddanswer.php" params:@{@"qid":qid, @"ans":answer, @"user_id":userId, @"user_email":userEmail} httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSDictionary *answerResponse = [completedOperation responseJSON];
        NSLog(@"%@", answerResponse);
        completionBlock(answerResponse);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
        errorBlock(error);
    }];
    
    return op;
}

// Get Weekly Winner
- (MKNetworkOperation *) getWinnerWithCompletionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:@"api/mgetwinner.php" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSDictionary *winnerResponse = [completedOperation responseJSON];
        NSLog(@"%@", winnerResponse);
        NSString *winnerText = nil;
        if ([winnerResponse objectForKey:@"winner"] && winnerResponse[@"winner"]) {
            winnerText = winnerResponse[@"winner"];
        }
        completionBlock(winnerText);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
        errorBlock(error);
    }];
    
    return op;
}

// SUGGESTION RELATED
- (MKNetworkOperation *) sendSuggestionFrom:(NSString *)name email:(NSString *)email phone:(NSString *)phone city:(NSString *)city text:(NSString *)text completionHandler:(IDBlock) completionBlock errorHandler:(MKNKErrorBlock)errorBlock
{
    NSDictionary *postParams = @{@"name":name, @"email":email, @"contact":phone, @"city":city, @"message":text};
    MKNetworkOperation *op = [self operationWithPath:@"api/msuggestion.php" params:postParams httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSDictionary *suggestionResponse = [completedOperation responseJSON];
        NSLog(@"%@", suggestionResponse);
        completionBlock(suggestionResponse);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
        errorBlock(error);
    }];
    
    return op;
}

// LOGIN RELATED
- (MKNetworkOperation *) loginWithUsername:(NSString *)username password:(NSString *)password completionHandler:(IDBlock) completionBlock errorHandler:(MKNKErrorBlock) errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:@"api/mlogin-answer.php" params:@{@"email":username, @"pwd":password} httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSLog(@"%@", completedOperation);
        NSDictionary *loginResponse = [completedOperation responseJSON];
        NSNumber *userId = nil;
        if ([loginResponse objectForKey:@"success"] && [loginResponse[@"success"] intValue] == 1 && loginResponse[@"id"]) {
            // set user values in standard defaults
            userId = [NSNumber numberWithInt:[loginResponse[@"id"] intValue]];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"user_id"];
            if (loginResponse[@"name"]) {
                [[NSUserDefaults standardUserDefaults] setObject:loginResponse[@"name"] forKey:@"user_name"];
            }
            if (loginResponse[@"email"]) {
                [[NSUserDefaults standardUserDefaults] setObject:loginResponse[@"email"] forKey:@"user_email"];
            }
            if (loginResponse[@"contact"]) {
                [[NSUserDefaults standardUserDefaults] setObject:loginResponse[@"contact"] forKey:@"user_contact"];
            }
            if (loginResponse[@"city"]) {
                [[NSUserDefaults standardUserDefaults] setObject:loginResponse[@"city"] forKey:@"user_city"];
            }
            
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        completionBlock(userId);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
        errorBlock(error);
    }];
    
    return op;
}


// SIGNUP RELATED
- (MKNetworkOperation *) signupWithName:(NSString *)name email:(NSString *)email password:(NSString *)password phone:(NSString *)phone city:(NSString *)city completionHandler:(IDBlock) completionBlock errorHandler:(MKNKErrorBlock) errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:@"api/mregister-user.php" params:@{@"name":name, @"email":email, @"pwd":password, @"contact":phone, @"city":city} httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
        NSDictionary *signupResponse = [completedOperation responseJSON];
        NSLog(@"%@", signupResponse);
        if ([signupResponse objectForKey:@"success"] && [signupResponse[@"success"] intValue] == 1 && signupResponse[@"id"]) {
            // set values in user defaults used while submitting answer
            result[@"id"] = [NSNumber numberWithInt:[signupResponse[@"id"] intValue]];
            [[NSUserDefaults standardUserDefaults] setObject:result[@"id"] forKey:@"user_id"];
            
            [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"user_name"];
            [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"user_email"];
            [[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"user_contact"];
            [[NSUserDefaults standardUserDefaults] setObject:city forKey:@"user_city"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        else if ([signupResponse objectForKey:@"msg"]) {
            result[@"msg"] = signupResponse[@"msg"];
        }
        completionBlock(result);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
        errorBlock(error);
    }];
    
    return op;
}

- (MKNetworkOperation *) getNewsWithCompletionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:@"api/mnews.php" params:nil httpMethod:@"GET"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSDictionary *newsResponse = [completedOperation responseJSON];
        NSLog(@"%@", newsResponse);
        completionBlock(newsResponse);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
        NSLog(@"%@", error);
        errorBlock(error);
    }];
    
    return op;
}


@end
