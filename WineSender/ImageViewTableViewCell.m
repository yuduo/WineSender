//
//  ImageViewTableViewCell.m
//  WineSender
//
//  Created by michael on 12/28/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "ImageViewTableViewCell.h"
#import "ImageModel.h"
#import "UIImageView+WebCache.h"

@implementation ImageViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateController:(NSArray*)imageArray
{
        __weak typeof(self) weakSelf = self;
        self.cycScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
            ImageModel* model = [imageArray objectAtIndex:pageIndex];
            
            UIImageView *imageView = [[UIImageView alloc]init];
            
            imageView.frame        = CGRectMake(0, 0,weakSelf.bounds.size.width, 168);
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:[@"http://fp.jydapp.com:82/fp/image/show.htm?path=" stringByAppendingString: model.path]]  placeholderImage:[UIImage imageNamed:@"no_image.9.png"]];
            return imageView;
        };
        
        self.cycScrollView.totalPagesCount = ^NSInteger(void){
            return imageArray.count;
        };
        self.cycScrollView.TapActionBlock = ^(NSInteger pageIndex){
            
        };
    
}
@end
