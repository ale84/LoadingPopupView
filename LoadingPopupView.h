//
//  LoadingPopupView.h
//  LiveItaly_iPad
//
//  Created by Alessio on 14/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

/*
 Simple View for displaying a loading popup with a semi-transparent black rounded rectangle as background.
 It contains an UIActivityIndicatorView whose size is never greater then 40 by 40 px, and it is placed in the center of the popup view.
 The loading animation is triggered by the two methods startAnimating and stopAnimating. The popup view by default  hides itself automatically when the animation is stopped.
 The activity view can be changed/replaced but it is generally not safe for now. 
*/

#import <UIKit/UIKit.h>


@interface LoadingPopupView : UIView {
    UIActivityIndicatorView *activityView;
    BOOL hidesItselfWhenAnimationStops;
    
}
@property(nonatomic,assign)BOOL hidesItselfWhenAnimationStops;
@property(nonatomic,retain)UIActivityIndicatorView *activityView;


//designated initializer
-(id)initWithFrame:(CGRect)frame;

-(void)startAnimating;
-(void)stopAnimating;

@end
