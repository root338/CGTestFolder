//
//  YMTestOCView.m
//  YMTestOCSwift
//
//  Created by apple on 2018/9/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMTestOCView.h"

@interface YMTestOCView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YMTestOCView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = UILabel.new;
        _titleLabel.text = NSStringFromClass([self class]);
        _titleLabel.textColor = UIColor.blackColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _titleLabel;
}

@end
