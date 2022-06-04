//
//  ViewController.h
//  movieApp
//
//  Created by Ahmed Hussien on 02/11/1443 AH.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "Protocoldel.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *ftitle;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property NSString *filmTitle;
@property NSString *filmYera;
@property NSString *filmRating;
@property NSString *filmGender;
@property UIImage *filmImage;


@property id<PRemove>p1;
- (IBAction)remove:(UIBarButtonItem *)sender;


@end

