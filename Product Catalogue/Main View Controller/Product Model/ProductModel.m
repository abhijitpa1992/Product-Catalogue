//
//  ProductModel.m
//  Product Catalogue
//
//  Created by Inspire One on 09/02/19.
//  Copyright © 2019 Inspire One. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

@synthesize product_name;
@synthesize product_manufacturer;
@synthesize product_price;
@synthesize product_promo_image_url;
@synthesize product_detail_url;

+ (ProductModel *)createEmptyObject{
    ProductModel *model = [[ProductModel alloc] init];
    return model;
}


@end
