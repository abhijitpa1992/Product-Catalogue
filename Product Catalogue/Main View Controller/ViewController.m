//
//  ViewController.m
//  Product Catalogue
//
//  Created by Inspire One on 09/02/19.
//  Copyright © 2019 Inspire One. All rights reserved.
//

#import "ViewController.h"
#import "ProductModel.h"
#import "ProductTableViewCell.h"
#import "ProductDetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *productList;
}
@property (weak, nonatomic) IBOutlet UITableView *product_list_tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Fill values to productList
    [self getFilteredProductListFromObject:[self getObjectFromJson]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    //Hide navigation bar in this viewcontroller
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    //Show navigation bar on moving to next viewcontroller
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void) getFilteredProductListFromObject:(NSDictionary *)product_obj {
    
    productList = [[NSMutableArray alloc] init];
    
    for (NSDictionary *unfiltered_product_object in [product_obj valueForKey:@"results"]) {
        ProductModel *product = [ProductModel createEmptyObject];
        if ([[unfiltered_product_object valueForKey:@"name"] isKindOfClass:[NSNull class]]) {
            product.product_name = @"NA";
        } else {
            product.product_name = [unfiltered_product_object valueForKey:@"name"];
        }
                if ([[unfiltered_product_object valueForKey:@"manufacturer"] isKindOfClass:[NSNull class]]) {
            product.product_manufacturer = @"NA";
        } else {
            product.product_manufacturer = [unfiltered_product_object valueForKey:@"manufacturer"];
        }
        if ([[[unfiltered_product_object valueForKey:@"price"] valueForKey:@"formattedValue"] isKindOfClass:[NSNull class]]) {
            product.product_price = @"NA";
        } else {
            product.product_price = [[unfiltered_product_object valueForKey:@"price"] valueForKey:@"formattedValue"];
        }
        if ([[unfiltered_product_object valueForKey:@"promoImageUrl"] isKindOfClass:[NSNull class]]) {
            product.product_promo_image_url = @"";
        } else {
            product.product_promo_image_url = [unfiltered_product_object valueForKey:@"promoImageUrl"];
        }
        if ([[unfiltered_product_object valueForKey:@"url"] isKindOfClass:[NSNull class]]) {
            product.product_detail_url = @"";
        } else {
            product.product_detail_url = [unfiltered_product_object valueForKey:@"url"];
        }
        [productList addObject:product];
    }
}

- (id) getObjectFromJson {
    // Retrieve local JSON file called example.json
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Response" ofType:@"json"];
    
    // Load the file into an NSData object called JSONData
    NSError *error = nil;

    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];

    // Create an Objective-C object from JSON Data
    id JSONObject = [NSJSONSerialization
                     JSONObjectWithData:JSONData
                     options:NSJSONReadingAllowFragments
                     error:&error];
    
    return JSONObject;
}

#pragma Table View Delegate & Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return productList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ProductTableViewCell";
    ProductTableViewCell *cell = (ProductTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    ProductModel* product = [ProductModel createEmptyObject];
    product = [productList objectAtIndex:indexPath.row];
    cell.name_label.text = product.product_name;
    cell.manufacturer_label.text = product.product_manufacturer;
    cell.price_label.text = product.product_price;
    [cell.product_preview_image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://s7d2.scene7.com/%@",product.product_promo_image_url]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductModel*product = [ProductModel createEmptyObject];
    product = [productList objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProductDetailsViewController *productDetailsVC = [storyboard instantiateViewControllerWithIdentifier:@"ProductDetailsViewController"];
    productDetailsVC.product = product;
    [self.navigationController pushViewController:productDetailsVC animated:YES];
}

@end
