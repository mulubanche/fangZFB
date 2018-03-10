//
//  JCDHomeViewController.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/9.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "JCDHomeViewController.h"

#import "PaymentModuleView.h"
#import "FunctionMoreView.h"
#import "HomeNewMegCell.h"
#import "HomeBigAdverCell.h"
#import "HomeSmallAdverCell.h"
#import "HomeInfoCell.h"
#import "HomeBottomView.h"
#import "HomeManager.h"
#import "HomeAllModel.h"

#define NavHeight (STATUSBAR_HEIGHT+54)

@interface JCDHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

/**
 导航栏view1
 */
@property (weak, nonatomic) IBOutlet UIView *nav_view_1;
/**
 view1右加号
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_1_add;
/**
 view1右用户
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_user;
/**
 view1搜索文字
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_title;
/**
 view1语音搜索
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_yu;

/**
 导航栏view2
 */
@property (weak, nonatomic) IBOutlet UIView *nav_view_2;
/**
 扫一扫
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_sao;
/**
 付钱
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_fu;
/**
 收钱
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_shou;
/**
 搜索
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_sou;
/**
 添加
 */
@property (weak, nonatomic) IBOutlet UIButton *nav_add;


@property (weak, nonatomic) IBOutlet UITableView *m_tb;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) PaymentModuleView *paymentView;
@property (nonatomic, strong) FunctionMoreView *FunctionMoreView;
@property (nonatomic, strong) HomeBottomView *tb_bottom_view;
@property (nonatomic, strong) NSMutableArray *functionItems;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation JCDHomeViewController
{
    CGFloat HeaderItemHeight;
    __weak IBOutlet NSLayoutConstraint *nav_height_layout;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true animated:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:false animated:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    nav_height_layout.constant = NavHeight;
    self.functionItems = [NSMutableArray array];
    
    [self loadData];
    
}


- (void) loadData{
    [HomeManagerIns getHomeItemsListWithApi:@"homeItemsList" completeBlock:^(NSError *error, id object) {
        if (object) {
            self.functionItems = HomeManagerIns.homeItemsList;
            [self createUI];
            [HomeManagerIns getHomeInfoWithApi:@"homeInfo" completeBlock:^(NSError *error, id object) {
                if (object) {
                    self.dataArr = HomeManagerIns.homeInfoList;
                }
                [self.m_tb reloadData];
                [self.m_tb.mj_header endRefreshing];
                [self.m_tb.mj_footer endRefreshing];
            }];
        }
    }];
    
}

- (void) getInfoListData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [HomeManagerIns getHomeInfoWithApi:@"homeInfo" completeBlock:^(NSError *error, id object) {
            if (object) {
                self.dataArr = HomeManagerIns.homeInfoList;
            }
            [self.m_tb reloadData];
            [self.m_tb.mj_header endRefreshing];
            [self.m_tb.mj_footer endRefreshing];
        }];
    });
    
}


- (void) createUI{
    HeaderItemHeight = (self.functionItems.count/4+1)*80;
    self.FunctionMoreView = [[FunctionMoreView alloc] initWithFrame:CGRectMake(0, -HeaderItemHeight-10, SCREEN_WIDTH, HeaderItemHeight+10)];
    self.FunctionMoreView.sourceData = _functionItems;
    self.FunctionMoreView.backgroundColor = [UIColor whiteColor];
    self.paymentView = [[NSBundle mainBundle] loadNibNamed:@"PaymentModuleView" owner:nil options:nil].lastObject;
    self.paymentView.frame = CGRectMake(0, -100-HeaderItemHeight, SCREEN_WIDTH, 100);
    
    self.m_tb.rowHeight = UITableViewAutomaticDimension;
    self.m_tb.estimatedRowHeight = 40;
    self.m_tb.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.m_tb.contentInset = UIEdgeInsetsMake(100+HeaderItemHeight, 0, 0, 0);
    self.m_tb.scrollIndicatorInsets = UIEdgeInsetsMake(100+HeaderItemHeight, 0, 0, 0);
    [self.m_tb addSubview:self.paymentView];
    [self.m_tb addSubview:self.FunctionMoreView];
    
    [self.m_tb registerNib:[UINib nibWithNibName:HomeInfoCellId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:HomeInfoCellId];
    [self.m_tb registerNib:[UINib nibWithNibName:HomeNewMegCellId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:HomeNewMegCellId];
    [self.m_tb registerNib:[UINib nibWithNibName:HomeBigAdverCellId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:HomeBigAdverCellId];
    [self.m_tb registerNib:[UINib nibWithNibName:HomeSmallAdverCellId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:HomeSmallAdverCellId];
    
    
    __weak typeof(self) weakSelf = self;
    self.m_tb.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf getInfoListData];
    }];

    [self.FunctionMoreView setFunctionMoreViewBlock:^(NSInteger index) {
        if (index==weakSelf.functionItems.count) {
            NSLog(@"点击的更多");
        }else{
            HomeFunctionItemModel *model = weakSelf.functionItems[index];
            NSLog(@"当前点击的是 = %@", model.name);
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataArr[indexPath.section];
    if ([model isKindOfClass:[HomeNewMsgModel class]]) {
        HomeNewMegCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeNewMegCellId forIndexPath:indexPath];
        cell.model = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if ([model isKindOfClass:[HomeSamllModel class]]){
        HomeSmallAdverCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeSmallAdverCellId forIndexPath:indexPath];
        cell.model = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if ([model isKindOfClass:[HomeBigModel class]]){
        HomeBigAdverCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeBigAdverCellId forIndexPath:indexPath];
        cell.model = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        HomeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeInfoCellId forIndexPath:indexPath];
        cell.model = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(section==self.dataArr.count-1) return self.tb_bottom_view;
    return UIView.new;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section==self.dataArr.count-1) return 72;
    return 0.00001;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    self.nav_view_1.alpha = 1-(offsetY+100+HeaderItemHeight)/NavHeight;
    self.nav_view_2.alpha = (offsetY+100+HeaderItemHeight)/NavHeight;
    self.paymentView.infoView.alpha = 1-(offsetY+100+HeaderItemHeight)/64;
    CGRect p_frame = self.paymentView.frame;
    CGRect f_frame = self.FunctionMoreView.frame;
    
    if (offsetY < -(100+HeaderItemHeight)) {
        p_frame.origin.y = offsetY;
        f_frame.origin.y = offsetY+90;
    } else {
        p_frame.origin.y = -(100+HeaderItemHeight);
        f_frame.origin.y = -HeaderItemHeight-10;
        
        CGFloat differ = (100+HeaderItemHeight)-ABS(offsetY);
        if (differ<90) {
            CGRect frame = self.paymentView.infoView.frame;
            frame.origin.y = differ*0.36;
            self.paymentView.infoView.frame = frame;
        }
    }
    self.paymentView.frame = p_frame;
    self.FunctionMoreView.frame = f_frame;
}

- (HomeBottomView *)tb_bottom_view{
    if (!_tb_bottom_view) {
        _tb_bottom_view = [[NSBundle mainBundle] loadNibNamed:@"HomeBottomView" owner:nil options:nil].lastObject;
    }
    return _tb_bottom_view;
}



@end
