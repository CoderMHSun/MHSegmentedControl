//
//  MHSegmentView.m
//  MHSegmentedControl
//
//  Created by Teplot_03 on 16/7/25.
//  Copyright © 2016年 Teplot_03. All rights reserved.
//

#import "MHSegmentView.h"
#import "HeaderButtonsView.h"
#import "MHPagerView.h"

@interface MHSegmentView ()<HeaderButtonsViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) HeaderButtonsView *headerButtonsView;

@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) NSMutableArray *pagerViewArray;

@property (nonatomic, strong) NSArray *titlesArray;

/** 这里存放三个tableView的数据*/
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MHSegmentView

+ (instancetype)segmentViewWithFrame:(CGRect)frame sectionTitles:(NSArray*)titlesArray contentBackGroundColor:(UIColor *)color {
    
    MHSegmentView *segmentview = [[MHSegmentView alloc] init];
    
    segmentview.titlesArray = titlesArray;
    
    segmentview.frame = frame;
    
    segmentview.backgroundColor = color;
    
    return segmentview;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.dataArray = [NSArray array];
    self.pagerViewArray = [NSMutableArray array];
    [self addSubview:self.headerButtonsView];
    [self addSubview:self.contentScrollView];
    
    NSLog(@"%@",NSStringFromCGRect(self.contentScrollView.frame));
}


#pragma mark - **************** public method
- (void)reload {
    for (MHPagerView *pagerView in _pagerViewArray) {
        [pagerView reloadData];
    }
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self reload];
}

#pragma mark - **************** HeaderButtonsView delegate
- (void)headerButtonsView:(HeaderButtonsView *)headerButtonsView ClickIndex:(NSInteger)index {
    [_headerButtonsView setCurrentIndex:index];
    
    CGSize size = self.frame.size;
    [self.contentScrollView setContentOffset:CGPointMake(size.width*index, 0) animated:YES];
}



- (HeaderButtonsView *)headerButtonsView {
    if (!_headerButtonsView) {
        _headerButtonsView = [[HeaderButtonsView alloc] init];
        _headerButtonsView.frame = CGRectMake(0, 0, ScreenSize.width, HeaderHeight);
        _headerButtonsView.delegate = self;
    }
    return _headerButtonsView;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.showsHorizontalScrollIndicator = YES;
        _contentScrollView.showsVerticalScrollIndicator = NO;
        _contentScrollView.frame = CGRectMake(0, HeaderHeight, self.frame.size.width, self.frame.size.height-HeaderHeight);
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = NO;
    }
    return _contentScrollView;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    _contentScrollView.frame = CGRectMake(0, HeaderHeight, self.frame.size.width, self.frame.size.height-HeaderHeight);
    
    _contentScrollView.contentSize = CGSizeMake(frame.size.width*self.titlesArray.count, frame.size.height);
    
    for (int i = 0; i<_titlesArray.count; i++) {
        //创建pagerView
        MHPagerView *pagerView = [[MHPagerView alloc] init];
        pagerView.frame = [self getPagerViewFrameWithIndex:i];
        pagerView.backgroundColor = [UIColor colorWithRed:arc4random()%225/225.0 green:arc4random()%225/225.0  blue:arc4random()%225/225.0  alpha:1];
        pagerView.tag = i;
        pagerView.delegate = self;
        pagerView.dataSource = self;
        
        [pagerView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        [_pagerViewArray addObject:pagerView];
        [self.contentScrollView addSubview:pagerView];
    }
}

- (void)setTitlesArray:(NSArray *)titlesArray {
    _titlesArray = titlesArray;
    
    _headerButtonsView.sectionTitles = titlesArray;
    
    
}

- (CGRect)getPagerViewFrameWithIndex:(NSInteger)index {
    
    CGSize size = self.frame.size;
    CGFloat x = ((float)index)*size.width;
    
    CGRect rect = CGRectMake(x, 0, size.width, size.height);
    
    return rect;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    _contentScrollView.backgroundColor = backgroundColor;
}


//>>>>>>>>>>>>>>>>代理方法>>>>>>>>>>>>>>>>>>>>>>>>>>

#pragma mark - tableViewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray*)(_dataArray[tableView.tag])).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *data = _dataArray[tableView.tag];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = data[indexPath.row];
    return cell;
}


@end
