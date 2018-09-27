//
//  YMTestOCVC.m
//  YMTestOCSwift
//
//  Created by apple on 2018/9/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMTestOCVC.h"

#import "YMTestOCSwift-Swift.h"

@interface YMTestOCVC ()

@end

@implementation YMTestOCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YMTestSwiftView *testView = [[YMTestSwiftView alloc] init];
    testView.frame = self.view.bounds;
    [self.view addSubview:testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
