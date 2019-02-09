//
//  ProductDetailsViewController.m
//  Product Catalogue
//
//  Created by Inspire One on 09/02/19.
//  Copyright © 2019 Inspire One. All rights reserved.
//

#import "ProductDetailsViewController.h"

@interface ProductDetailsViewController ()

@end

@implementation ProductDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void) setupUI {
    self.product_name_label.text = self.product.product_name;
    self.product_manufacturer_name.text = self.product.product_manufacturer;
    self.product_price_name.text = self.product.product_price;
    NSURL *nsurl=[NSURL URLWithString:[NSString stringWithFormat:@"https://www.homedepot.ca/%@",self.product.product_detail_url]];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [self.product_details loadRequest:nsrequest];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
