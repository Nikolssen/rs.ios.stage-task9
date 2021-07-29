//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan Budovich
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorsViewController.h"

@interface ColorsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, copy) NSArray<NSString*>* texts;
@property (nonatomic, copy) NSArray<UIColor*>* colors;
@property (nonatomic, assign) NSInteger selectedColor;
@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    
    self.texts = @[@"#be2813", @"#3802da", @"#467c24", @"#808080", @"#8e5af7", @"#f07f5a", @"#f3af22", @"#3dacf7", @"#e87aa4", @"0f2e3f", @"#213711", @"#511307", @"#92003b"];
    self.colors = @[
        [UIColor colorWithRed:190.0/255.0 green:40.0/255.0 blue:19.0/255.0 alpha:1.0],
        [UIColor colorWithRed:56.0/255.0 green:2.0/255.0 blue:218.0/255.0 alpha:1.0],
        [UIColor colorWithRed:70.0/255.0 green:124.0/255.0 blue:36.0/255.0 alpha:1.0],
        [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0],
        [UIColor colorWithRed:142.0/255.0 green:90.0/255.0 blue:247.0/255.0 alpha:1.0],
        [UIColor colorWithRed:240.0/255.0 green:127.0/255.0 blue:90.0/255.0 alpha:1.0],
        [UIColor colorWithRed:243.0/255.0 green:175.0/255.0 blue:34.0/255.0 alpha:1.0],
        [UIColor colorWithRed:61.0/255.0 green:172.0/255.0 blue:247.0/255.0 alpha:1.0],
        [UIColor colorWithRed:232.0/255.0 green:122.0/255.0 blue:164.0/255.0 alpha:1.0],
        [UIColor colorWithRed:15.0/255.0 green:46.0/255.0 blue:63.0/255.0 alpha:1.0],
        [UIColor colorWithRed:33.0/255.0 green:55.0/255.0 blue:17.0/255.0 alpha:1.0],
        [UIColor colorWithRed:81.0/255.0 green:19.0/255.0 blue:7.0/255.0 alpha:1.0],
        [UIColor colorWithRed:146.0/255.0 green:0.0 blue:59.0/255.0 alpha:1.0],
    ];
    
    UITableView* tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[[tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:90.0], [tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:35], [tableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10]]];
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"ColorCell"];
    
    tableView.layer.cornerRadius = 16.0;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"ColorCell"];
    cell.textLabel.textColor = self.colors[indexPath.row];
    cell.textLabel.text = self.texts[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:17.0];
    if (indexPath.row == self.selectedColor) {
        cell.tintColor = UIColor.redColor;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedColor = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
