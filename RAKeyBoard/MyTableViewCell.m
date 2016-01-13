//
//  MyTableViewCell.m
//  RAKeyBoard
//
//  Created by rano on 16/1/12.
//  Copyright © 2016年 rano. All rights reserved.
//

#import "MyTableViewCell.h"
#import "RAKeyboardManager.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        self.tf.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:self.tf];
        
        [[RAKeyboardManager shareManager] addObserveredView:self.tf];
    }
    return self;
}

- (void)configWithIndexPath:(NSIndexPath *)indexPath
{
    self.tf.text = [NSString stringWithFormat:@"cell %ld",indexPath.row];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
