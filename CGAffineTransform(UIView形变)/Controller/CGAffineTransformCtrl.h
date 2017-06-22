//
//  CGAffineTransformCtrl.h
//  CGAffineTransform(UIView形变)
//
//  Created by LOLITA on 17/6/21.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGAffineTransformCtrl : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
- (IBAction)next:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UILabel *label;


- (IBAction)nextPageBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextPage;


@end
