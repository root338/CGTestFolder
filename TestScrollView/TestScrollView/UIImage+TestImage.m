//
//  UIImage+TestImage.m
//  TestScrollView
//
//  Created by apple on 2018/5/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIImage+TestImage.h"

#pragma mark - CGFloat
/** 计算 maxWith - (left + right) */
CG_INLINE CGFloat CG_CGWidthWithMaxWidth(CGFloat maxWidth, UIEdgeInsets edgeInsets)
{
    return maxWidth - (edgeInsets.left + edgeInsets.right);
}

/** 计算 maxHeight - (top + bottom) */
UIKIT_STATIC_INLINE CGFloat CG_CGHeightWithMaxHeight(CGFloat maxHeight, UIEdgeInsets edgeInsets)
{
    return maxHeight - (edgeInsets.top + edgeInsets.bottom);
}

/** 计算 left + width + right */
UIKIT_STATIC_INLINE CGFloat CG_CGMaxWidthWithWidth(CGFloat width, UIEdgeInsets edgeInsets)
{
    return edgeInsets.left + width + edgeInsets.right;
}

/** 计算 top + height + bottom */
UIKIT_STATIC_INLINE CGFloat CG_CGMaxHeightWithHeight(CGFloat height, UIEdgeInsets edgeInsets)
{
    return edgeInsets.top + height + edgeInsets.bottom;
}

/** 计算视图 中心 x 坐标 */
UIKIT_STATIC_INLINE CGFloat CG_CGCenterOriginX(CGFloat viewWidth, CGFloat superviewWidth) {
    return (superviewWidth - viewWidth) / 2.0;
}

/** 计算视图 中心 y 坐标 */
UIKIT_STATIC_INLINE CGFloat CG_CGCenterOriginY(CGFloat viewHeight, CGFloat superviewHeight) {
    return (superviewHeight - viewHeight) / 2.0;
}

#pragma mark - CGSize
/** 计算 { maxWith - (left + right), maxHeight - (top + bottom) } */
UIKIT_STATIC_INLINE CGSize CG_CGSizeWidthMaxSize(CGSize maxSize, UIEdgeInsets edgeInsets)
{
    return CGSizeMake(CG_CGWidthWithMaxWidth(maxSize.width, edgeInsets), CG_CGHeightWithMaxHeight(maxSize.height, edgeInsets));
}

/** 计算 { left + width + right, top + height + bottom } */
UIKIT_STATIC_INLINE CGSize CG_CGMaxSizeWidthSize(CGSize size, UIEdgeInsets edgeInsets)
{
    return CGSizeMake(CG_CGMaxWidthWithWidth(size.width, edgeInsets), CG_CGMaxHeightWithHeight(size.height, edgeInsets));
}

/** 获取两个CGSize值中更小的width和height */
UIKIT_STATIC_INLINE CGSize CG_CGMinSize(CGSize s1, CGSize s2)
{
    return CGSizeMake(MIN(s1.width, s2.width), MIN(s1.height, s2.height));
}

/** 获取两个CGSize值中更大的width和height */
UIKIT_STATIC_INLINE CGSize CG_CGMaxSize(CGSize s1, CGSize s2)
{
    return CGSizeMake(MAX(s1.width, s2.width), MAX(s1.height, s2.height));
}

#pragma mark - CGPoint

/** 计算 { p1.x + x, p1.y + y } */
UIKIT_STATIC_INLINE CGPoint CG_CGPointWithOffset(CGPoint p1, CGFloat x, CGFloat y)
{
    return CGPointMake(p1.x + x, p1.y + y);
}

/** 计算 { p1.x + p2.x, p1.y + p2.y } */
UIKIT_STATIC_INLINE CGPoint CG_CGPointWithOffsetPoint(CGPoint p1, CGPoint p2)
{
    return  CG_CGPointWithOffset(p1, p2.x, p2.y);
}

/** 获取 s1 的中心点 */
UIKIT_STATIC_INLINE CGPoint CG_CGCenterWithSize(CGSize s1)
{
    return CGPointMake(s1.width / 2.0, s1.height / 2.0);
}

/** 获取 s2 在 s1 居中时的起始坐标 */
UIKIT_STATIC_INLINE CGPoint CG_CGCenterOriginWith(CGSize s1, CGSize s2)
{
    return CGPointMake((s1.width - s2.width) / 2.0, (s1.height - s2.height) / 2.0);
}

/** 获取view在父视图的中心坐标下的起始坐标 */
UIKIT_STATIC_INLINE CGPoint CG_CGCenterPointWith(UIView *superview, UIView *view)
{
    return CGPointMake((CGRectGetWidth(superview.bounds) - CGRectGetWidth(view.bounds)) / 2.0, (CGRectGetHeight(superview.bounds) - CGRectGetHeight(view.bounds)) / 2.0);
}

UIKIT_STATIC_INLINE CGPoint CG_CGMidPointWith(CGPoint p1, CGPoint p2)
{
    return CGPointMake((p1.x + p2.x) / 2.0, (p1.y + p2.y) / 2.0);
}

#pragma mark - CGRect
/** 计算 { { left, top }, { width - (left + right), height - (top + bottom) } } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithMargin(CGRect rect, UIEdgeInsets edgeInsets)
{
    return CGRectMake(edgeInsets.left, edgeInsets.top, CG_CGWidthWithMaxWidth(CGRectGetWidth(rect), edgeInsets), CG_CGHeightWithMaxHeight(CGRectGetHeight(rect), edgeInsets));
}

/** 计算 { { originX - left, originY - top}, { width + left + right, height + top + bottom } } */
UIKIT_STATIC_INLINE CGRect CG_CGFrameWithMargin(CGRect frame, UIEdgeInsets edgeInsets)
{
    return CGRectMake(CGRectGetMinX(frame) - edgeInsets.left, CGRectGetMinY(frame) - edgeInsets.top, CGRectGetWidth(frame) + edgeInsets.left + edgeInsets.right, CGRectGetHeight(frame) + edgeInsets.top + edgeInsets.bottom);
}

/** 计算 { { originX + left, originY + top}, { width - left - right, height - top - bottom } } */
UIKIT_STATIC_INLINE CGRect CG_CGFrameWithMaxFrame(CGRect frame, UIEdgeInsets edgeInsets)
{
    return CGRectMake(CGRectGetMinX(frame) + edgeInsets.left, CGRectGetMinY(frame) + edgeInsets.top, CG_CGWidthWithMaxWidth(CGRectGetWidth(frame), edgeInsets), CG_CGHeightWithMaxHeight(CGRectGetHeight(frame), edgeInsets));
}

/** 计算 { { 0, 0}, { width, height } } */
UIKIT_STATIC_INLINE CGRect CG_CGBoundsWithFrame(CGRect frame)
{
    return CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
}

/** 计算 { { 0, 0 }, { width + (left + right), height + (top + bottom) } } */
UIKIT_STATIC_INLINE CGRect CG_CGMaxBoundsWithRectMargin(CGRect rect, UIEdgeInsets edgeInsets)
{
    return CGRectMake(0, 0, CG_CGMaxWidthWithWidth(CGRectGetWidth(rect), edgeInsets), CG_CGMaxHeightWithHeight(CGRectGetHeight(rect), edgeInsets));
}

/** 忽略顶部 计算 { { left, originY }, { width - (left + right), height - (originY + bottom) } } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithExcludeTop(CGRect rect, UIEdgeInsets edgeInsets, CGFloat originY)
{
    return CGRectMake(edgeInsets.left, originY, CG_CGWidthWithMaxWidth(CGRectGetWidth(rect), edgeInsets), rect.size.height - (originY + edgeInsets.bottom));
}

/** 忽略底部 计算 { { left, top }, { width - (left + right), height} } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithExcludeBottom(CGRect rect, UIEdgeInsets edgeInsets, CGFloat height)
{
    return CGRectMake(edgeInsets.left, edgeInsets.top, CG_CGWidthWithMaxWidth(CGRectGetWidth(rect), edgeInsets), height);
}

/** 忽略垂直 计算 { { left, originY }, { width - (left + right), height } } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithExcludeVertical(CGRect rect, UIEdgeInsets edgeInsets, CGFloat originY, CGFloat height)
{
    return CGRectMake(edgeInsets.left, originY, CG_CGWidthWithMaxWidth(CGRectGetWidth(rect), edgeInsets), height);
}

/** 忽略右边 计算 { { left, top }, { width , height - (top + bottom) } } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithExcludeRight(CGRect rect, UIEdgeInsets edgeInsets, CGFloat width)
{
    return CGRectMake(edgeInsets.left, edgeInsets.top, width, CG_CGHeightWithMaxHeight(CGRectGetHeight(rect), edgeInsets));
}

/** 忽略左边 计算 { { originX, top }, { width - (originX + right), height - (top + bottom) } }  */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithExcludeLeft(CGRect rect, UIEdgeInsets edgeInsets, CGFloat originX) {
    return CGRectMake(originX, edgeInsets.top, CGRectGetWidth(rect) - (originX + edgeInsets.right), CG_CGHeightWithMaxHeight(CGRectGetHeight(rect), edgeInsets));
}

/** 忽略水平 计算 { { originX, top }, { width , height - (top + bottom) } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithExcludeHorizontal(CGRect rect, UIEdgeInsets edgeInsets, CGFloat originX, CGFloat width)
{
    return CGRectMake(originX, edgeInsets.top, width, CG_CGHeightWithMaxHeight(CGRectGetHeight(rect), edgeInsets));
}

/** 计算 { position, size } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithMake(CGPoint position, CGSize size)
{
    return CGRectMake(position.x, position.y, size.width, size.height);
}

/** 计算 { {center.x - width / 2, centr.y - height / 2 }, size } */
UIKIT_STATIC_INLINE CGRect CG_CGRectWithCenterMake(CGPoint center, CGSize size)
{
    return CGRectMake(center.x - size.width / 2.0, center.y - size.height / 2.0, size.width, size.height);
}

@implementation UIImage (TestImage)

- (CGRect)imageFrameWithSize:(CGSize)size contentModel:(UIViewContentMode)contentModel
{
    CGRect frame = CGRectZero;
    
    CGSize imageSize = self.size;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    switch (contentModel) {
        case UIViewContentModeTop:
            x = CG_CGCenterOriginX(imageSize.width, size.width);
            break;
        case UIViewContentModeTopRight:
            x = size.width - imageSize.width;
            break;
        case UIViewContentModeRight:
            x = size.width - imageSize.width;
            y = CG_CGCenterOriginY(imageSize.height, size.height);
            break;
        case UIViewContentModeBottomRight:
            x = size.width - imageSize.width;
            y = size.height - imageSize.height;
            break;
        case UIViewContentModeBottom:
            x = CG_CGCenterOriginX(imageSize.width, size.width);
            y = size.height - imageSize.height;
            break;
        case UIViewContentModeBottomLeft:
            y = size.height - imageSize.height;
            break;
        case UIViewContentModeLeft:
            y = CG_CGCenterOriginY(imageSize.height, size.height);
            break;
        case UIViewContentModeCenter:
            x = CG_CGCenterOriginX(imageSize.width, size.width);
            y = CG_CGCenterOriginY(imageSize.height, size.height);
            break;
        case UIViewContentModeScaleToFill:
            width = size.width;
            height = size.height;
            break;
        case UIViewContentModeScaleAspectFit:
        case UIViewContentModeScaleAspectFill:
        {
            
            CGFloat s1 = imageSize.width / size.width;
            CGFloat s2 = imageSize.height / size.height;
            if (s1 < s2) {
                if (UIViewContentModeScaleAspectFit == contentModel) {
                    width   = imageSize.width / s2;
                    height  = size.height;
                }else {
                    width   = size.width;
                    height  = imageSize.height / s1;
                }
            }else {
                if (UIViewContentModeScaleAspectFit == contentModel) {
                    width   = size.width;
                    height  = imageSize.height / s2;
                }else {
                    width   = imageSize.width / s1;
                    height  = size.height;
                }
            }
            
            x = CG_CGCenterOriginX(width, size.width);
            y = CG_CGCenterOriginY(height, size.height);
            break;
        }
        default:
            break;
    }
    
    frame = CGRectMake(x, y, width, height);
    
    return frame;
}

@end
