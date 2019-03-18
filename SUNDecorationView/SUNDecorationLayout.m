//
//  SUNDecorationLayout.m
//  DayDayCook
//
//  Created by sunlimin on 2019/2/25.
//  Copyright © 2019 DayDayCook. All rights reserved.
//

#import "SUNDecorationLayout.h"
#import "SUNDecorationCornerView.h"
#import "SUNDecorationView.h"

@implementation SUNDecorationLayout

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    
    NSInteger numOfItems = [self.collectionView numberOfItemsInSection:section];
    if (numOfItems > 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
        NSIndexPath *lastIndexPath = [NSIndexPath indexPathForItem:numOfItems - 1 inSection:section];
        UICollectionViewLayoutAttributes *firstItem = [self layoutAttributesForItemAtIndexPath:indexPath];
        UICollectionViewLayoutAttributes *lastItem = [self layoutAttributesForItemAtIndexPath:lastIndexPath];
        
        //calculate the frame of section background view
        CGRect frame = CGRectUnion(firstItem.frame, lastItem.frame);
        if (section == [self.collectionView numberOfSections] - 1) {
            frame.size.height += [UIScreen mainScreen].bounds.size.height;
        }
        layoutAttributes.frame = frame;
        layoutAttributes.zIndex = -1;
    }
    return  layoutAttributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray<UICollectionViewLayoutAttributes *> *attributes = [super layoutAttributesForElementsInRect:rect].mutableCopy;
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttributes = @[].mutableCopy;
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UICollectionViewLayoutAttributes * temp;
        if (obj.indexPath.section == 0) {
            temp = [self layoutAttributesForDecorationViewOfKind:NSStringFromClass([SUNDecorationCornerView class]) atIndexPath:obj.indexPath];
        } else {
            temp = [self layoutAttributesForDecorationViewOfKind:NSStringFromClass([SUNDecorationView class]) atIndexPath:obj.indexPath];
        }
        if (temp) {
            if (CGRectIntersectsRect(temp.frame, rect))
            {
                [newAttributes addObject:temp];
            }
        }
    }];
    [attributes addObjectsFromArray:newAttributes];
    
    return attributes;
}

@end
