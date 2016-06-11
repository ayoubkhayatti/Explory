//
//  SearchTableViewCell.h
//  Explory
//
//  Created by Ayoub Khayatti on 11/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (assign, nonatomic) BOOL verified;

@end
