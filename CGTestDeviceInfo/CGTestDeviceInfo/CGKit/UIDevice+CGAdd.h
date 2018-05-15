//
//  UIDevice+CGAdd.h
//  CGTestDeviceInfo
//
//  Created by apple on 2018/4/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (CGAdd)

#pragma mark - 设备信息
/** 设备的 machine, iPhone7,1 */
@property (nullable, nonatomic, readonly) NSString *machineModel;

#pragma mark - 磁盘信息
/** 磁盘总大小 (byte) */
@property (nonatomic, assign, readonly) int64_t systemDiskTotalSize;
/** 磁盘可使用大小 (byte) */
@property (nonatomic, assign, readonly) int64_t systemDiskFreeSize;
/** 磁盘已经使用的大小 (byte) */
@property (nonatomic, assign, readonly) int64_t systemDiskUsedSize;


- (void)AllIpAddress;

@end

NS_ASSUME_NONNULL_END
