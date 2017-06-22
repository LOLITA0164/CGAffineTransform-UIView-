//
//  GestureRecognizerCtrl.m
//  CGAffineTransform(UIView形变)
//
//  Created by LOLITA on 17/6/21.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import "GestureRecognizerCtrl.h"

@interface GestureRecognizerCtrl ()

@end

@implementation GestureRecognizerCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}


-(void)initUI{
    
    [self.view addSubview:self.testView];
    
    //点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 2;
    [self.testView addGestureRecognizer:tap];
    
    //拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.testView addGestureRecognizer:pan];
    
    
    //捏合手势
    UIPinchGestureRecognizer *pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinAction:)];
    [self.testView addGestureRecognizer:pin];
    
    
    //旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.testView addGestureRecognizer:rotation];
    
}


#pragma mark - 点击手势
-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    if (CGAffineTransformIsIdentity(self.testView.transform)) {
        [UIView animateWithDuration:0.5 animations:^{
            self.testView.transform = CGAffineTransformScale(self.testView.transform, 1.3, 2);
        }];
    }
    else{
        [UIView animateWithDuration:0.5 animations:^{
            self.testView.transform = CGAffineTransformIdentity;
        }];
    }
    
}



#pragma mark - 拖拽手势
-(void)panAction:(UIPanGestureRecognizer *)pan{
    
    //获取手势位置
    CGPoint position = [pan translationInView:self.testView];
    //通过 CGAffineTransformTranslate 获取 新的transform
    self.testView.transform = CGAffineTransformTranslate(self.testView.transform, position.x, position.y);
    //将增加置为 0
    [pan setTranslation:CGPointZero inView:self.testView];
  
}



#pragma mark - 捏合手势
-(void)pinAction:(UIPinchGestureRecognizer *)pin{
    
    //设置缩放比例
    self.testView.transform = CGAffineTransformScale(self.testView.transform, pin.scale, pin.scale);
    //将scale置为 1
    pin.scale = 1;
    
}




#pragma mark - 旋转手势
-(void)rotation:(UIRotationGestureRecognizer *)rotation{
    
    //旋转变换
    self.testView.transform = CGAffineTransformRotate(self.testView.transform, rotation.rotation);
    //将旋转的角度 置为 0
    rotation.rotation = 0;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
