//
//  customView.m
//  animationHujiang
//
//  Created by zhanming on 16/5/30.
//  Copyright © 2016年 zhanming. All rights reserved.
//

#import "customView.h"
#define  NSTimeInterval 0.4;
@interface customView ()
@property(nonatomic,strong)CAShapeLayer * shape;
@property(nonatomic,strong)UIView * view;

@end


@implementation customView

//
//  myView.m
//  storyboard
//
//  Created by zhanming on 16/5/30.
//  Copyright © 2016年 zhanming. All rights reserved.
//



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
-(void)setUp
{
    
    CAReplicatorLayer *rep=[CAReplicatorLayer layer];
    
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height-30)];
    
    [path addLineToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height-5)];
    
    
    
    CAShapeLayer *shape=[CAShapeLayer layer];
   
    shape.frame=self.bounds;
    shape.path=path.CGPath;
    shape.lineWidth=4;
    shape.strokeColor=[UIColor redColor].CGColor;
    shape.lineCap=kCALineCapRound;
    self.shape=shape;
    
    
    UIView *view=[UIView new];
    
    view.frame=CGRectMake(0, 0, 40, 40);
    view.backgroundColor=[UIColor yellowColor];
    view.center=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self addSubview:view];
    self.view=view;
  
    
    
    
    //shape.strokeEnd=1;
    
    //    CALayer *layer=[CALayer layer];
    //
    //    [self.layer addSublayer:rep];
    //    layer.position=CGPointMake(0, 0);
    //    layer.bounds=CGRectMake(0, 0, 5, 50);
    //    //layer.anchorPoint=CGPointMake(0.5,1);
    //    layer.backgroundColor=[UIColor redColor].CGColor;
    //
    //    CABasicAnimation *basic=[CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    //
    //    basic.toValue=@(0.1);
    //    basic.duration=0.3;
    //    basic.repeatCount=MAXFLOAT;
    //    basic.autoreverses=YES;
    //
    //    [layer addAnimation:basic forKey:@"basic"];
    //
    
    //[self.layer addSublayer:shape];
    
    [rep addSublayer:shape];
    [self.layer addSublayer:rep];
    rep.frame=self.bounds;
    rep.instanceCount=5;
    
    
    CATransform3D transform = CATransform3DIdentity;
    
    CGFloat angle= -(360/rep.instanceCount*M_PI)/180.0;
    
    //    CGFloat cang=0;
    //
    //    CGFloat X=sin(angle)*(cang);
    //
    //    CGFloat Y=cos(angle)*(cang)-cang;
    //
    //
    //
    //    transform = CATransform3DTranslate(transform, X, Y, 0);
    
    
    transform = CATransform3DRotate(transform,-angle, 0.0, 0.0, 1.0);
    
    rep.instanceTransform = transform;
    
    
    
    
    
    
    //rep.instanceTransform=CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), );
    //CATransform3DEqualToTransform(CATransform3DMakeTranslation(20, 0, 0), CATransform3DMakeRotation(M_PI_4, 0, 0, 1));
    
    [self animationstrokeEnd];
    [self animationScale];

    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if([[anim valueForKey:@"animationName"] isEqualToString:@"strokeEnd"])
    {//[self.shape removeAllAnimations];
        
        [self animationstrokeStart];
        [self animationScaleTwo];
        
        
    }
    else if([[anim valueForKey:@"animationName"] isEqualToString:@"strokeStart"])
    {
        
        [self.shape removeAllAnimations];
        [self.view.layer removeAllAnimations];
        [self animationstrokeEnd];
        [self animationScale];
        
    }
    
    //[self.shape removeAllAnimations];
    //self.shape.strokeEnd=1;
    //self.shape.strokeStart=0;
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [self animation];
    //    });
    //[self animationstrokeEnd];
    
//    radiusAnimation.fillMode = kCAFillModeForwards;
//    radiusAnimation.removedOnCompletion = NO;
}

-(void)animationstrokeEnd
{
    
    self.shape.strokeStart=0;
    self.shape.strokeEnd=1;
    CABasicAnimation *basicShape=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    basicShape.fromValue=@(0);
    basicShape.duration=NSTimeInterval;
    //basicShape.repeatCount=MAXFLOAT;
    //basicShape.autoreverses=YES;
    basicShape.delegate=self;
    [basicShape setValue:@"strokeEnd" forKey:@"animationName"];
    [self.shape addAnimation:basicShape forKey:@"strokeEnd"];
    
    
    
    
}

-(void)animationstrokeStart
{
    
    
    self.shape.strokeStart=1;
    CABasicAnimation *basicShape=[CABasicAnimation animationWithKeyPath:@"strokeStart"];
    
    basicShape.fromValue=@(0);
    basicShape.duration=NSTimeInterval;
    //basicShape.repeatCount=MAXFLOAT;
    //basicShape.autoreverses=YES;
    basicShape.delegate=self;
    [basicShape setValue:@"strokeStart" forKey:@"animationName"];
    [self.shape addAnimation:basicShape forKey:@"strokeStart"];
    
  
    
    
}


-(void)animationScale
{
    
    CABasicAnimation *basicTransform=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    basicTransform.toValue=@(1.3);
    basicTransform.duration=NSTimeInterval;
    basicTransform.fillMode = kCAFillModeForwards;
    basicTransform.removedOnCompletion = NO;
    basicTransform.delegate=self;
    [self.view.layer addAnimation:basicTransform forKey:@"basicTransform"];
}

-(void)animationScaleTwo
{
    
    CABasicAnimation *basicTransform=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    basicTransform.fromValue=@(1.3);
    basicTransform.toValue=@(1.0);
    basicTransform.duration=NSTimeInterval;
    basicTransform.fillMode = kCAFillModeForwards;
    basicTransform.removedOnCompletion = NO;
    basicTransform.delegate=self;
    [self.view.layer addAnimation:basicTransform forKey:@"basicTransform"];
}








@end
