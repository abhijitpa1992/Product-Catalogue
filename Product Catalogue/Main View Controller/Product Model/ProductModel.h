//
//  ProductModel.h
//  Product Catalogue
//
//  Created by Inspire One on 09/02/19.
//  Copyright © 2019 Inspire One. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductModel : NSObject

@property (strong, nonatomic) NSString *product_name;
@property (strong, nonatomic) NSString *product_manufacturer;
@property (strong, nonatomic) NSString *product_price;
@property (strong, nonatomic) NSString *product_promo_image_url;
@property (strong, nonatomic) NSString *product_detail_url;

+ (ProductModel *)createEmptyObject;

@end

NS_ASSUME_NONNULL_END
