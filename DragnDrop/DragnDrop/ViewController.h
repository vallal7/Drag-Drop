//
//  ViewController.h
//  DragnDrop
//
//  Created by Ganesh, Ashwin on 2/28/17.
//  Copyright © 2017 Ashwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property(nonatomic, retain) UIImageView *dragObject;
@property(nonatomic, retain) IBOutlet UIView *dropTarget;
@property(nonatomic, assign) CGPoint touchOffset;
@property (nonatomic, assign) CGPoint homePosition;

@end

