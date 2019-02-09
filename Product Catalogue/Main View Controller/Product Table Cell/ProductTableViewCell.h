//
//  ProductTableViewCell.h
//  Product Catalogue
//
//  Created by Inspire One on 09/02/19.
//  Copyright © 2019 Inspire One. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *product_preview_image;
@property (weak, nonatomic) IBOutlet UILabel *name_label;
@property (weak, nonatomic) IBOutlet UILabel *manufacturer_label;
@property (weak, nonatomic) IBOutlet UILabel *price_label;

@end

NS_ASSUME_NONNULL_END
