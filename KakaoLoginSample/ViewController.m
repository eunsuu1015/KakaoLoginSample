//
//  ViewController.m
//  KakaoLoginSample
//
//  Created by Eunsuu1015 on 2021/11/25.
//

#import "ViewController.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark Button Event

- (IBAction)btnLoginClick:(id)sender {
    [self reqKakaoLogin];
}

- (IBAction)btnLogoutClick:(id)sender {
    [self reqKakaoLogout];
}


#pragma mark - Kakao

-(void)reqKakaoLogin {
    if (![[KOSession sharedSession] isOpen]) {
        [[KOSession sharedSession] close];
    }
    
    [[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
        if (error) {
            NSLog(@"login error: %@", error);
        } else {
            NSLog(@"login succeeded.");
            [self getUserInfo];
        }
    }];
}

-(void)reqKakaoLogout {
    [[KOSession sharedSession] logoutAndCloseWithCompletionHandler:^(BOOL success, NSError *error) {
        if (error) {
            NSLog(@"logout error: %@", error);
        } else {
            NSLog(@"logout succeeded.");
        }
    }];
}

-(void)getUserInfo {
    [KOSessionTask userMeTaskWithCompletion:^(NSError * _Nullable error, KOUserMe * _Nullable me) {
        if (error){
            NSLog(@"get user info error: %@", error);
        } else {
            NSLog(@"get user info: %@", me);
        }
    }];
}


@end
