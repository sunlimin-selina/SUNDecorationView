//
//  SUNDecorationFooterView.m
//  DayDayCook
//
//  Created by sunlimin on 2019/2/25.
//  Copyright © 2019 DayDayCook. All rights reserved.
//

#import "SUNDecorationFooterView.h"
#import "Masonry.h"

@implementation SUNDecorationFooterView
@synthesize imageView = _imageView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

#pragma mark - private -

- (void)initialization
{
    [self addSubview:self.imageView];
 
//    self.backgroundColor = COLOR_F8F8F8;
    
    [self setupViewConstraints];
}

- (void)setupViewConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

#pragma mark - getter
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"txdd_img_deco2"]];
    }
    return _imageView;
}
@end
