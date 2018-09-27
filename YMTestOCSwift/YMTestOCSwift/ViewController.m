//
//  ViewController.m
//  YMTestOCSwift
//
//  Created by apple on 2018/9/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

#import "YMTestOCSwift-Swift.h"
#import "YMTestOCVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handleGoOCVC:(id)sender {
    YMTestOCVC *testVC = YMTestOCVC.new;
    [self.navigationController pushViewController:testVC animated:YES];
}
- (IBAction)handleGoSwiftVC:(id)sender {
    YMTestSwiftVC *testVC = YMTestSwiftVC.new;
    [self.navigationController pushViewController:testVC animated:YES];
}


@end
