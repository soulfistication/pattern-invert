//
//  CheckeredBoardView.m
//  pattern-invert
//
//  Created by Iván Almada on 2/20/24.
//

#import "CheckeredBoardView.h"
#import "CheckeredView.h"

#define NUM_ROWS 16
#define NUM_COLUMNS 16

#define TIME_INTERVAL 0.5

@interface CheckeredBoardView ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray<CheckeredView *> *checkeredSubViews;

@end

@implementation CheckeredBoardView

#pragma mark - UIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    NSLog(@"%@", @"initWithCoder not implemented");
    exit(0);
}

- (void)awakeFromNib {
    [super awakeFromNib];

    CGFloat width = self.frame.size.width / NUM_COLUMNS;
    CGFloat height = self.frame.size.height / NUM_ROWS;

    CGFloat x = 0;
    CGFloat y = 0;

    self.checkeredSubViews = @[].mutableCopy;

    for (NSInteger i = 0; i < NUM_ROWS; i++) {

        for (NSInteger j = 0; j < NUM_COLUMNS; j++) {
            CheckeredView *checkeredView = [[CheckeredView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            checkeredView.translatesAutoresizingMaskIntoConstraints = NO;
            checkeredView.filled = (i+j) % 2 == 0;
            [self.checkeredSubViews addObject:checkeredView];
            [self addSubview:checkeredView];
            x += width;
        }
        y += height;
        x = 0;
    }

    self.timer = [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self toggleCheckeredView];
    }];

}

- (void)toggleCheckeredView {
    NSLog(@"%@", @"Toggle Color");
    for (CheckeredView * checkeredView in self.checkeredSubViews) {
        [checkeredView toggleColor];
    }
}

@end
