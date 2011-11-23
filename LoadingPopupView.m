//
//  LoadingPopupView.m
//  LiveItaly_iPad
//
//  Created by Alessio on 14/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoadingPopupView.h"


@implementation LoadingPopupView
@synthesize activityView, hidesItselfWhenAnimationStops;

-(void)dealloc{
    [activityView release];
    [super dealloc];
}

-(id)init{
    self = [self initWithFrame:CGRectMake(0, 0, 0, 0)];
    return self;
}

//designated initializer
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectInset(CGRectMake(0, 0, frame.size.width, frame.size.height), 1, 1)];
        double minSize = fmin(self.frame.size.height, self.frame.size.width);
        if (minSize > 40.0) {
            minSize = 40.0;
        }
        
        hidesItselfWhenAnimationStops = YES;
        activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, minSize, minSize)];
        //NSLog(@"aView center x: %f y: %f",activityView.center.x, activityView.center.y);
        //[activityView startAnimating];
        //[activityView setHidden:NO];
        [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self addSubview:activityView];
        activityView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        self.hidden = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    //CGRect theRect = self.frame;
    UIBezierPath *thePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) cornerRadius:20.0f];
    [[UIColor colorWithWhite:0 alpha:.55f]setFill];
    [thePath fill];
    
    [super drawRect:rect];
}

-(void)startAnimating{
    if (hidesItselfWhenAnimationStops) {
        self.hidden = NO;
    }
    [self.activityView startAnimating];
}

-(void)stopAnimating{
    if (hidesItselfWhenAnimationStops) {
        self.hidden = YES;
    }
    [self.activityView stopAnimating];        
}

@end

