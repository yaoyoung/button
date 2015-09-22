//
//  UIButton+Service.m
//  button
//
//  Created by yangyao on 15/9/17.
//  Copyright (c) 2015年 yangyao. All rights reserved.
//
#define RGBACOLOR(r,g,b,a) \
[UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

#import "UIButton+Service.h"
@implementation UIButton (Service)
- (void)MyButtonWithFrame:(CGRect)frame
               textString:(NSString *)textString
                subString:(NSString *)subString
                 imageUrl:(NSString *)imageUrl

{
    
    self.backgroundColor = [UIColor whiteColor];
    self.frame = frame;
    [self setImage:[UIImage imageNamed:imageUrl] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:imageUrl] forState:UIControlStateHighlighted];
    
    [self setTitle:textString forState:UIControlStateNormal];
    [self setTitleColor:RGBACOLOR(59, 59, 59, 1.0) forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Arial" size:13];
    
    
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //行间距离
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineSpacing = 6.0;
    NSDictionary *ats = @{
                          NSParagraphStyleAttributeName : paragraphStyle,
                          };
    
    //文字分行 并设置字体颜色，大小
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n%@",textString,subString] attributes:ats];
    
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:15] range:NSMakeRange(0, textString.length)];
    [str addAttribute:NSForegroundColorAttributeName value:RGBACOLOR(59, 59, 59, 1.0) range:NSMakeRange(0, textString.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:10] range:NSMakeRange(str.length - subString.length, subString.length)];
    [str addAttribute:NSForegroundColorAttributeName value:RGBACOLOR(0xA0, 0xA0, 0xA0, 1.0) range:NSMakeRange(str.length - subString.length, subString.length)];
    [self setAttributedTitle:str forState:UIControlStateNormal];
    
    //调整图片和字体的位置
    CGSize titleSize = [textString boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:15]} context:nil].size;
    CGSize titleSizea = [subString boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:10]} context:nil].size;
    CGFloat t = (titleSize.width > titleSizea.width)?titleSize.width:titleSizea.width;
    [self setImageEdgeInsets:UIEdgeInsetsMake(-32.0,0.0,0,-t)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(60.0,-28,0.0,0.0)];
}

@end
