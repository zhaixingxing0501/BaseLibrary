//
//  ViewController.m
//  BaseLibrary
//
//  Created by nucarf on 2020/11/16.
//

#import "ViewController.h"

#import "UITextFieldNumber.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    UITextFieldNumber *text = [[UITextFieldNumber alloc] initWithFrame:CGRectMake(100, 100, 300, 50)];
    UITextFieldNumber *text = [[UITextFieldNumber alloc] init];
//    text.delegate = self;
    [self.view addSubview:text];
    text.frame  = CGRectMake(100, 100, 300, 50);
    text.keyboardType = UIKeyboardTypeDecimalPad;
    
    
    
    NSLog(@"%f", [UIScreen mainScreen].scale);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%@", textField.text);
}


@end
