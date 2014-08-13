//
//  ViewController.m
//  UIPickerViewDemo
//
//  Created by dongway on 14-8-13.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *text;
    __weak IBOutlet UIPickerView *pickerview;
    NSArray *datas;
}
@end

@implementation ViewController

-(void)loadView{
    [super loadView];
    
    text.delegate = self;
    
    pickerview.dataSource = self;
    pickerview.delegate = self;
    pickerview.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    datas = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return datas.count;
}

//加载数据
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [datas objectAtIndex:row];
}

//点击事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *value = [datas objectAtIndex:row];
    text.text = value;
    pickerview.hidden = YES;
    [text resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"edite");
    pickerview.hidden = NO;
    return true;
}

@end
