//
//  ViewController.m
//  Demo
//
//  Created by sajiner on 2017/8/1.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import "ViewController.h"


#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "TestViewController.h"
#import "OneViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.equalTo(-19);
    }];
    
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    TestViewController *testVc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testVc animated:YES];
    
}

@end
