//
//  ProductDetailsViewController.h
//  Product Catalogue
//
//  Created by Inspire One on 09/02/19.
//  Copyright © 2019 Inspire One. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ProductModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *product_name_label;
@property (weak, nonatomic) IBOutlet UILabel *product_manufacturer_name;
@property (weak, nonatomic) IBOutlet UILabel *product_price_name;
@property (weak, nonatomic) IBOutlet WKWebView *product_details;

@property (strong, nonatomic) ProductModel *product;

@end

NS_ASSUME_NONNULL_END
