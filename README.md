# MHSegmentedControl #
顶部菜单，不可滑动

# 具体使用方法：#

<pre><code>
#define RandomColor (arc4random()%255)/255.0

 - (void)viewDidLoad {
    [super viewDidLoad];
    
    MHSegmentView *seg = [MHSegmentView segmentViewWithTitles:@[@"第一块",@"第二块",@"第三块"] delegate:self];
    seg.frame = CGRectMake(0, 20, 320, 480);
    [self.view addSubview:seg];       
}

- (UIView *)segmentView:(MHSegmentView *)segmentView index:(NSInteger)index {
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithRed:RandomColor green:RandomColor blue:RandomColor alpha:1];
    return view;
    
}
</code></pre>

