//
//  ViewController.m
//  qqTestDemo
//
//  Created by 李一贤 on 2018/3/8.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)login;
@property (weak, nonatomic) IBOutlet UITextField *qqName;
@property (weak, nonatomic) IBOutlet UITextField *qqPassWord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.qqName.delegate = self;
    self.qqPassWord.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login
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
