//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"
#import "ColorsViewController.h"
@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, assign) BOOL shouldDrawStories;
@property (nonatomic, copy) NSString* colorDescription;
@property (nonatomic, strong) UIColor* color;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    self.navigationItem.title = @"Settings";
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView = tableView;
    tableView.scrollEnabled = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"SettingsCell"];
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[[tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:0.0], [tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:0], [tableView.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor], [tableView.centerYAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerYAnchor]]];
    self.color = [UIColor colorWithRed:0.953 green:0.686 blue:0.133 alpha:1];
    self.colorDescription = @"#f3af22";
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* cell;
    
    if (!indexPath.row){
        cell = [UITableViewCell new];
        cell.textLabel.text = @"Draw stories";
        UISwitch* theSwitch = [UISwitch new];
        theSwitch.on = self.shouldDrawStories;
        [theSwitch addTarget:self action:@selector(switchToggle:) forControlEvents:UIControlEventValueChanged];


        cell.accessoryView = theSwitch;
        
    }
    else {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SettingCell"];
        cell.textLabel.text = @"Stroke color";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.textColor = self.color;
        cell.detailTextLabel.text = self.colorDescription;
    }
    cell.textLabel.font = [UIFont systemFontOfSize:17.0];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row){
        ColorsViewController* colorsVC = [ColorsViewController new];
        [colorsVC setColor:self.colorDescription];
        __weak typeof(self) weakSelf = self;
        colorsVC.colorSetter = ^void(UIColor* color, NSString* string) {
            weakSelf.colorSetter(color);
            weakSelf.color = color;
            weakSelf.colorDescription = string;
            [weakSelf.tableView reloadData];
        };
        [self.navigationController pushViewController:colorsVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) switchToggle:(UISwitch*) sender{
    self.shouldDrawStories = sender.isOn;
    self.shouldAnimateSetter(sender.isOn);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


@end
