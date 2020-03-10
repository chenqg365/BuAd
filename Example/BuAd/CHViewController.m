//
//  CHViewController.m
//  BuAd
//
//  Created by chenqg365 on 03/10/2020.
//  Copyright (c) 2020 chenqg365. All rights reserved.
//

#import "CHViewController.h"
#import "BuAdManager.h"
#import "MBProgressHUD.h"
#import <BUAdSDK/BURewardedVideoAd.h>
#import <BUAdSDK/BURewardedVideoModel.h>
#import <Masonry/Masonry.h>

@interface CHViewController ()<BURewardedVideoAdDelegate>

@property (nonatomic, strong) BURewardedVideoAd *rewardedVideoAd;
@property (nonatomic, strong) UIButton *adShowBtn;

@end

@implementation CHViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initBuAd];
    [self initUI];
}

- (void)initBuAd{
    BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    self.rewardedVideoAd = [[BURewardedVideoAd alloc] initWithSlotID:[BuAdManager slotID] rewardedVideoModel:model];
    self.rewardedVideoAd.delegate = self;
    [self.rewardedVideoAd loadAdData];
}

- (void)initUI{
    [self.adShowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(60);
        make.right.mas_equalTo(self.view.mas_right).offset(-60);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(50);
    }];
}

#pragma mark - BURewardedVideoAdDelegate

- (void)rewardedVideoAdDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"%s",__func__);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.offset = CGPointMake(0, -100);
    hud.label.text = @"reawrded data load success";
    [hud hideAnimated:YES afterDelay:0.2];
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
        _adShowBtn.backgroundColor = [UIColor blueColor];
        [_adShowBtn setTitle:@"show Ad" forState:UIControlStateNormal];
        [_adShowBtn addTarget:self action:@selector(showAd) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_adShowBtn];
    }
    return _adShowBtn;
}

@end
