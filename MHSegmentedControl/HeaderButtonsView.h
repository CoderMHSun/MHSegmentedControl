//
//  HeaderButtonsView.h
//  MHSegmentedControl
//
//  Created by Teplot_03 on 16/7/25.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderButtonsView;

#define HeaderHeight 40//最后注意乘上scale
#define ScreenSize [[UIScreen mainScreen] bounds].size


@protocol HeaderButtonsViewDelegate <NSObject>

- (void)headerButtonsView:(HeaderButtonsView *)headerButtonsView ClickIndex:(NSInteger)index;

@end

@interface HeaderButtonsView : UIView
@property (nonatomic, weak) id <HeaderButtonsViewDelegate> delegate;


@property (nonatomic, strong) NSArray *sectionTitles;


- (void)setCurrentIndex:(NSInteger)index;

@end
