//
//  CHViewController.m
//  BuAd
//
//  Created by chenqg365 on 03/10/2020.
//  Copyright (c) 2020 chenqg365. All rights reserved.
//

#import "CHViewController.h"
#import "BuAdManager.h"
#import <BUAdSDK/BURewardedVideoAd.h>
#import <BUAdSDK/BURewardedVideoModel.h>

@interface CHViewController ()<BURewardedVideoAdDelegate>

@property (nonatomic, strong) BURewardedVideoAd *rewardedVideoAd;
@property (nonatomic, strong) UIButton *adShowBtn;

@end

@implementation CHViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.adShowBtn];
    [self initBuAd];
}

- (void)initBuAd{
    BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    self.rewardedVideoAd = [[BURewardedVideoAd alloc] initWithSlotID:[BuAdManager slotID] rewardedVideoModel:model];
    self.rewardedVideoAd.delegate = self;
    [self.rewardedVideoAd loadAdData];
}


#pragma mark - BURewardedVideoAdDelegate

- (void)rewardedVideoAdDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"%s",__func__);
    [self.adShowBtn setTitle:@"广告加载完成" forState:UIControlStateNormal];
    self.adShowBtn.backgroundColor = [UIColor redColor];
}

- (void)rewardedVideoAdVideoDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"%s",__func__);
}

- (void)rewardedVideoAdWillVisible:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"%s",__func__);
}

- (void)rewardedVideoAdDidClose:(BURewardedVideoAd *)rewardedVideoAd {
     NSLog(@"%s",__func__);
}

- (void)rewardedVideoAd:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    NSLog(@"%s",__func__);
}

- (void)rewardedVideoAdDidPlayFinish:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
       NSLog(@"%s",__func__);
}

- (void)rewardedVideoAdServerRewardDidFail:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"%s",__func__);
}

- (void)rewardedVideoAdServerRewardDidSucceed:(BURewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"%s",__func__);
}

-(BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - internal method

- (void)showAd{
    NSLog(@"-- > showAd");
    [self.rewardedVideoAd showAdFromRootViewController:self];
}

#pragma mark - getter

- (UIButton *)adShowBtn{
    if (!_adShowBtn) {
        _adShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _adShowBtn.frame = CGRectMake(20, 200, 280 , 50);
        _adShowBtn.center = self.view.center;
        _adShowBtn.backgroundColor = [UIColor blueColor];
        [_adShowBtn setTitle:@"显示广告" forState:UIControlStateNormal];
        [_adShowBtn addTarget:self action:@selector(showAd) forControlEvents:UIControlEventTouchUpInside];
    }
    return _adShowBtn;
}

@end
