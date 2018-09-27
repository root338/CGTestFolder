//
//  ViewController.m
//  TestScrollView
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+CornerRadius.h"

#import "YMDiaryPostsCellManager.h"

@interface ViewController ()
<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
    
    YMDiaryPostsCellManager *manager = [YMDiaryPostsCellManager new];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [manager getCellHeightWithData:indexPath width:self.view.frame.size.width];
    [manager getDiaryPostsContentImageWithIndexPath:indexPath completion:^(UIImage *image) {
        
//        [self.imageView zy_cornerRadiusRoundingRect];
        [self.imageView setImage:image];
    }];
//    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
//    [self.imageView zy_cornerRadiusRoundingRect];
//    [self.imageView setImage:image];
    
    
}

- (IBAction)handleButtonClick:(id)sender {
    NSLog(@"可以交互");
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
