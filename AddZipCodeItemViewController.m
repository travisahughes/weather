//
//  AddZipCodeItemViewController.m
//  Weather
//
//  Created by Travis Hughes on 2/14/15.
//  Copyright (c) 2015 Travis Hughes. All rights reserved.
//

#import "AddZipCodeItemViewController.h"

@interface AddZipCodeItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddZipCodeItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if(sender != self.saveButton) return;
    
    if(self.textField.text.length > 0){
        self.zipCodeItem = [[ZipCodeItem alloc] init];
        self.zipCodeItem.itemZipCode = self.textField.text;
        self.zipCodeItem.selected = NO;
    }
}


@end
