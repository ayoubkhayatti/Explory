//
//  SearchTableViewCell.m
//  Explory
//
//  Created by Ayoub Khayatti on 11/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "SearchTableViewCell.h"

@interface SearchTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *verifiedLabel;

@end

@implementation SearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.verifiedLabel.hidden = true;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.nameLabel.text = @"";
    self.categoryLabel.text = @"";
    self.distanceLabel.text = @"";
    self.verifiedLabel.hidden = true;
}

- (void)setVerified:(BOOL)verified{
    if (_verified != verified) {
        _verified = verified;
    }
    if (self.verified == true) {
        self.verifiedLabel.hidden = false;
    }
}

@end
