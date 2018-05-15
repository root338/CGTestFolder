
//
//  MLCertificateModel.m
//  YMTestPush
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLCertificateModel.h"


// http://www.apple.com/certificateauthority/Apple_WWDR_CPS
static NSString * const APNSSecIdentityTypeDevelopmentCustomExtension = @"1.2.840.113635.100.6.3.1";
static NSString * const APNSSecIdentityTypeProductionCustomExtension = @"1.2.840.113635.100.6.3.2";
static NSString * const APNSSecIdentityTypeUniversalCustomExtension = @"1.2.840.113635.100.6.3.6";

OSStatus extractIdentityAndTrust(CFDataRef dataRef, SecIdentityRef *identityRef, SecTrustRef *trustRef) {
    OSStatus securityError = errSecSuccess;
    CFStringRef password = CFSTR("1");
    const void *keys[] = {kSecImportExportPassphrase};
    const void *values[] = {password};
    CFDictionaryRef optionsDictionary = CFDictionaryCreate(NULL, keys, values, 1, NULL, NULL);
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    securityError = SecPKCS12Import(dataRef, optionsDictionary, &items);
    if (securityError == errSecSuccess) {
        CFDictionaryRef identityAndTrust = CFArrayGetValueAtIndex(items, 0);
        const void *tempIdentity = NULL;
        tempIdentity = CFDictionaryGetValue(identityAndTrust, kSecImportItemIdentity);
        *identityRef = (SecIdentityRef)tempIdentity;
        const void *tempTrust = NULL;
        tempTrust = CFDictionaryGetValue(identityAndTrust, kSecImportItemTrust);
        *trustRef = (SecTrustRef)tempTrust;
    }
    
    if (optionsDictionary) {
        CFRelease(optionsDictionary);
    }
    
    return securityError;
}

NSDictionary * APNSecValuesForIdentity(SecIdentityRef identity) {
    
    SecCertificateRef certificateRef;
    SecIdentityCopyCertificate(identity, &certificateRef);
    NSArray *keys = @[
                      APNSSecIdentityTypeDevelopmentCustomExtension,
                      APNSSecIdentityTypeProductionCustomExtension,
                      APNSSecIdentityTypeUniversalCustomExtension,
                      ];
    
    
    CFRelease(certificateRef);
    
    return values;
}

@implementation MLCertificateModel


/**
 使用SecPKCS12Import函数从 .p12 文件中提取identity和可信任对象，以及评估其可信度
 */
- (void)c
{
    NSString *certificatePath = [[NSBundle mainBundle] pathForResource:@"YMDev" ofType:@"p12"];
    NSData *certificateData = [[NSData alloc] initWithContentsOfFile:certificatePath];
    
    CFDataRef certificateDataRef = (__bridge CFDataRef)certificateData;
    OSStatus status = noErr;
    
    SecIdentityRef identityRef;
    SecTrustRef trustRef;
    
    status = extractIdentityAndTrust(certificateDataRef, &identityRef, &trustRef);
    
    NSAssert(status == errSecSuccess, @"");
    
    // kSecTrustResultInvalid，kSecTrustResultDeny，kSecTrustResultFatalTrustFailure 是无法进行处理
    // kSecTrustResultRecoverableTrustFailure 可以从信息失败中恢复
    SecTrustResultType trustResult;
    status = SecTrustEvaluate(trustRef, &trustResult);
    
    NSAssert(trustResult != kSecTrustResultRecoverableTrustFailure, @"");
    
    /// 提取证书信息
    SecCertificateRef certificateRef = NULL;
    status = SecIdentityCopyCertificate(identityRef, &certificateRef);
    NSAssert(status == errSecSuccess, @"");
    CFStringRef certSummary = SecCertificateCopySubjectSummary(certificateRef);
    NSString *summary = [[NSString alloc] initWithString:(__bridge NSString *)certSummary];
    CFRelease(certSummary);
    
}



@end
