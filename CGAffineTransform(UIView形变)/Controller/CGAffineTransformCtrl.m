//
//  CGAffineTransformCtrl.m
//  CGAffineTransform(UIView形变)
//
//  Created by LOLITA on 17/6/21.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import "CGAffineTransformCtrl.h"
#import "GestureRecognizerCtrl.h"

@interface CGAffineTransformCtrl ()
{
    NSInteger next;
    NSArray *titles;
}

@property(strong,nonatomic)UIImageView *imageView;

@end

@implementation CGAffineTransformCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}


-(void)changeTransform:(NSInteger)type{

    CGFloat time = 1.0;
    
    WS(ws);

    [UIView animateWithDuration:time animations:^{
        
        
        
        
        
        
        
        
        
        
        CGAffineTransform transform;
        
        switch (type) {
            case 0:
            {
                CGPoint point =  CGPointMake(123, 222);
                CGSize size = CGSizeMake(33, 44);
                CGRect rect = CGRectMake(20, 30, 50, 100);
                CGPoint pointNew =  CGPointApplyAffineTransform(point, CGAffineTransformMakeTranslation(77, 28));
                CGSize sizeNew = CGSizeApplyAffineTransform(size, CGAffineTransformMakeScale(2, 2));
                CGRect rectNew = CGRectApplyAffineTransform(rect, CGAffineTransformMakeRotation(M_PI));
                self.label.text = [NSString stringWithFormat:@"%@移动(77, 28)后：%@\n%@放大2倍后：%@\n%@旋转M_PI后：%@",NSStringFromCGPoint(point),NSStringFromCGPoint(pointNew),NSStringFromCGSize(size),NSStringFromCGSize(sizeNew),NSStringFromCGRect(rect),NSStringFromCGRect(rectNew)];
            }
                break;
            case 1:
            {
                transform = CGAffineTransformMakeTranslation(-100, 150);         //移动
            }
                break;
            case 2:
            {
                transform = CGAffineTransformMakeScale(2, 2);                   //缩放
            }
                break;
            case 3:
            {
                transform = CGAffineTransformMakeRotation(M_PI);                //旋转
            }
                break;
            case 4:
            {
                transform = CGAffineTransformMakeScale(3, 3);                   //相反动画  缩小至1/3
                transform = CGAffineTransformInvert(transform);
//                transform = CGAffineTransformMakeTranslation(-100, 150);         //(100，－150)方向运动
//                transform = CGAffineTransformInvert(transform);
            }
                break;
            case 5:
            {
                CGAffineTransform transform_A = CGAffineTransformMakeTranslation(0, 200);
                CGAffineTransform transform_B = CGAffineTransformMakeScale(0.2, 0.2);
                transform = CGAffineTransformConcat(transform_B, transform_A);
                //判断两种变形是否相等
                BOOL isEqual = CGAffineTransformEqualToTransform(transform_A, transform_B);
                DLog(@"%@",isEqual?@"一样":@"不一样");
            }
                break;
            case 6:
            {
                transform = CGAffineTransformMakeRotation(M_PI);                //旋转
                transform = CGAffineTransformTranslate(transform, -50, 150);    //加移动
                transform = CGAffineTransformScale(transform, 2, 2);            //加缩放
            }
                break;
                
            default:
                break;
        }

        ws.imageView.transform = transform;
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
        
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:time animations:^{
            
            ws.imageView.transform =  CGAffineTransformIdentity;              //回到最初
            
        } completion:^(BOOL finished) {
            
            self.nextBtn.userInteractionEnabled = YES;
            [self.nextBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
            
        }];
 
    }];
    
    
}























































































-(void)initUI{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
    
    titles = @[@"移动",@"缩放",@"旋转",@"3倍相反效果",@"合并多种动画",@"多种形变",@"应用仿射矩阵"];
    
    [self.nextBtn setTitle:titles.firstObject forState:UIControlStateNormal];
    
    
     UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.nextPage];
    self.navigationItem.rightBarButtonItem = item;
    
}




-(UIImageView *)imageView{
    if (_imageView==nil) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aa"]];
        _imageView.frame = CGRectMake(0, 0, 100, 80);
    }
    return _imageView;
}



- (IBAction)next:(UIButton *)sender {

    next++;
    
    NSInteger type = next%titles.count;

    sender.userInteractionEnabled = NO;
    [sender setTitleColor:self.view.backgroundColor forState:UIControlStateNormal];
    [self.nextBtn setTitle:titles[type] forState:UIControlStateNormal];
    
    DLog(@"执行动画%ld",type);

    [self changeTransform:type];

}





- (IBAction)nextPageBtn:(UIButton *)sender {
    
    GestureRecognizerCtrl *ctrl = [GestureRecognizerCtrl new];
    [self.navigationController pushViewController:ctrl animated:YES];
    
}
@end
