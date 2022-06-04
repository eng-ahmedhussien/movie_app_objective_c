//
//  TableViewController.h
//  movieApp
//
//  Created by Ahmed Hussien on 02/11/1443 AH.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Protocoldel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController <NSURLConnectionDelegate,NSURLSessionDataDelegate,PRemove>
@property NSMutableData *data;
@property NSDictionary *dict;
@property NSMutableArray *arrayOfData;

@end

NS_ASSUME_NONNULL_END
