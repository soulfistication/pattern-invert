//
//  CheckeredView.m
//  pattern-invert
//
//  Created by Iván Almada on 2/20/24.
//

#import "CheckeredView.h"

@implementation CheckeredView

#pragma mark - UIView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    NSLog(@"%@", @"initWithCoder not implemented");
    exit(0);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Helpers

- (void)toggleColor {
    self.isFilled ? (self.backgroundColor = [UIColor whiteColor]) : (self.backgroundColor = [UIColor blackColor]);
    self.filled = !self.isFilled;
}

@end
