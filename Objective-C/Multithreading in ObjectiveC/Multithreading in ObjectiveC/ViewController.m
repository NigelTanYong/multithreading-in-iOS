//
//  ViewController.m
//  Multithreading in ObjectiveC
//
//  Created by Nigel Tan Yong on 2/3/24.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)randomImage:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://loremflickr.com/2000/2000"];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData: data];
    
    self.imageView.image = image;
}


@end
