//
//  ViewController.m
//  DragnDrop
//
//  Created by Ganesh, Ashwin on 2/28/17.
//  Copyright © 2017 Ashwin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (touches.count == 1) {
        // one finger touch
        CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
        for (UIImageView *iView in self.view.subviews) {
            if ([iView isMemberOfClass:[UIImageView class]]) {
                if(touchPoint.x > iView.frame.origin.x &&
                   touchPoint.y > iView.frame.origin.y &&
                   touchPoint.x < iView.frame.origin.x + iView.frame.size.width &&
                   touchPoint.y < iView.frame.origin.y + iView.frame.size.height) {
                    self.dragObject = iView;
                    self.touchOffset = CGPointMake(touchPoint.x - iView.frame.origin.x,
                                                   touchPoint.y - iView.frame.origin.y);
                    self.homePosition = CGPointMake(iView.frame.origin.x, iView.frame.origin.y);
                    [self.view bringSubviewToFront:self.dragObject];
                }
                   
            }
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint newPoint = [[touches anyObject] locationInView:self.view];
    CGRect newDragObjectFrame = CGRectMake(newPoint.x - self.touchOffset.x,newPoint.y - self.touchOffset.y,self.dragObject.frame.size.width, self.dragObject.frame.size.height);
    self.dragObject.frame = newDragObjectFrame;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if(touchPoint.x > self.dropTarget.frame.origin.x &&
       touchPoint.x < self.dropTarget.frame.origin.x + self.dropTarget.frame.size.width &&
       touchPoint.y > self.dropTarget.frame.origin.y &&
       touchPoint.y < self.dropTarget.frame.origin.y + self.dropTarget.frame.size.height) {
        self.dropTarget.backgroundColor = self.dragObject.backgroundColor;
    }
    self.dragObject.frame = CGRectMake(self.homePosition.x, self.homePosition.y, self.dragObject.frame.size.width, self.dragObject.frame.size.height);
}

@end
