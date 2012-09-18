//
//  CAPFirstViewController.h
//  Capitals
//
//  Created by Mihir Singh on 6/6/12.
//

#import <UIKit/UIKit.h>

@interface CAPFirstViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *score;
@property (nonatomic, retain) IBOutlet UILabel *country;
@property (nonatomic, retain) IBOutlet UILabel *capital;

- (void)setup;
- (void)fill;
- (void)warmup;
- (void)process;

- (IBAction)saidY;
- (IBAction)saidN;
- (IBAction)reset;

@end
