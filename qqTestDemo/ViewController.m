//
//  ViewController.m
//  qqTestDemo
//
//  Created by 李一贤 on 2018/3/8.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *qqName;
@property (weak, nonatomic) IBOutlet UITextField *qqPassWord;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.qqName.delegate = self;
    self.qqPassWord.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
    //1.创建第一个按钮
    UIButton* btn = [[UIButton alloc] init];
    //2.设置按钮位置
    btn.frame = CGRectMake(164,349,46,30);
    //3.添加
    [self.view addSubview:btn];
    //4.设置文字
    [btn setTitle:@"login" forState:UIControlStateNormal];
    [btn setTitle:@"login" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [btn addTarget:(self) action:(@selector(login:)) forControlEvents:(UIControlEventTouchUpInside)];
    //创建第二个按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addBtn addTarget:self action:@selector(login:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:addBtn];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login:(UIButton*)btn
{
    NSLog(@"%@,%@",self.qqName.text,self.qqPassWord.text);
}

//实现UITextFieldDelegate代理中的textFieldShouldReturn方法，点击文本输入框ruturn键后退出键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField// called when 'return' key pressed. return NO to ignore.
{
    [textField resignFirstResponder];//resign，释放第一响应者；UITextField的上上层基类是UIResponder
    return  YES;
}

//// 重写基类UIResponder中的触摸完成方法，实现点击键盘以外的区域退出键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];//调用UIView中接口关掉键盘
    
}
@end
