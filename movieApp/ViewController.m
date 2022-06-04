//
//  ViewController.m
//  movieApp
//
//  Created by Ahmed Hussien on 02/11/1443 AH.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ftitle.text = _filmTitle;
    _year.text=_filmYera;
    _gender.text=_filmGender;
    _rating.text=_filmRating;
    _image.image = _filmImage;
}


- (IBAction)remove:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [_p1 RemoveCell];
}
@end
