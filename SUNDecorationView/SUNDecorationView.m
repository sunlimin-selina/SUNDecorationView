//
//  SUNDecorationView.m
//  DayDayCook
//
//  Created by sunlimin on 2019/2/25.
//  Copyright © 2019 DayDayCook. All rights reserved.
//

#import "SUNDecorationView.h"
#import "Masonry.h"

@implementation SUNDecorationView
@synthesize decorationView = _decorationView;

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

#pragma mark - private

- (void)initialization
{
    [self addSubview:self.decorationView];
//    self.backgroundColor = COLOR_F8F8F8;
    
    [self.decorationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - getter

- (UIImageView *)decorationView
{
    if (!_decorationView) {
        _decorationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"txdd_img_deco3"]];
    }
    return _decorationView;
}

@end
