//
//  UIDevice+CGAdd.m
//  CGTestDeviceInfo
//
//  Created by apple on 2018/4/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIDevice+CGAdd.h"

#import <sys/sysctl.h>
//#import <sys/utsname.h>
#import <ifaddrs.h>
#import <sys/socket.h>
#import <arpa/inet.h>

@implementation UIDevice (CGAdd)

- (NSString *)machineModel
{
    static NSString *model;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
//        struct utsname systemInfo;
//        uname(&systemInfo);
//        model   = [NSString stringWithUTF8String:systemInfo.machine];
        
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine   = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        model   = [NSString stringWithUTF8String:machine];
        free(machine);
        
    });
    
    return model;
}

- (int64_t)systemDiskTotalSize
{
    NSError *err = nil;
    NSDictionary *att = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&err];
    if (err != nil) return -1;
    int64_t totalSize = [[att objectForKey:NSFileSystemSize] longLongValue];
    if (totalSize < 0) return -1;
    return totalSize;
}

- (int64_t)systemDiskFreeSize
{
    NSError *err = nil;
    NSDictionary *att = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&err];
    if (err != nil) return -1;
    int64_t freeSize = [[att objectForKey:NSFileSystemFreeSize] longLongValue];
    if (freeSize < 0) return -1;
    return freeSize;
}

- (int64_t)systemDiskUsedSize
{
    int64_t totalSize   = self.systemDiskTotalSize;
    int64_t freeSize    = self.systemDiskFreeSize;
    if (totalSize < 0 || freeSize < 0) return -1;
    int64_t usedSize = totalSize - freeSize;
    if (usedSize < 0) return -1;
    return usedSize;
}

/**
 
 ifaddrs->ifa_name:
 pdp_ip0 :
 en0     : WIFI 地址
 */

- (void)AllIpAddress
{
    struct ifaddrs *addrs = NULL;
    if (getifaddrs(&addrs) == 0) {
        
        struct ifaddrs *addr = addrs;
        while (addr) {
            
            sa_family_t family = addr->ifa_addr->sa_family;
            switch (family) {
                case AF_INET:
                {
                    char str[INET_ADDRSTRLEN] = {0};
                    inet_ntop(family, &(((struct sockaddr_in *)addr->ifa_addr)->sin_addr), str, sizeof(str));
                    if (strlen(str) > 0) {
                        NSLog(@"%@: %@", [NSString stringWithUTF8String:addr->ifa_name], [NSString stringWithUTF8String:str]);
                    }
                }
                    break;
                case AF_INET6:
                {
                    char str[INET6_ADDRSTRLEN] = {0};
                    inet_ntop(family, &(((struct sockaddr_in6 *)addr->ifa_addr)->sin6_addr), str, sizeof(str));
                    if (strlen(str) > 0) {
                        NSLog(@"%@: %@", [NSString stringWithUTF8String:addr->ifa_name], [NSString stringWithUTF8String:str]);
                    }
                }
                default:
                    break;
            }
            addr = addr->ifa_next;
        }
    }
    freeifaddrs(addrs);
}

@end
