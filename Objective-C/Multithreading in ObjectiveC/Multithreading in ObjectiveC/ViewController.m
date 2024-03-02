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
    // Create a URL session configuration with default settings
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // Create a URL session with the configuration
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    // Create a download task with the URL
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error) {
               // Handle error
               NSLog(@"Failed to download image: %@", [error localizedDescription]);
               return;
           }
           // Convert fetched data into UIImage
           UIImage *image = [UIImage imageWithData:data];
           // Update UI on the main thread
           dispatch_async(dispatch_get_main_queue(), ^{
               // Set the fetched image to the imageView
               self.imageView.image = image;
           });
       }];
       // Start the download task
       [task resume];
}


@end
