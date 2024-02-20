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

#define WIDTH 100
#define HEIGHT 100

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

    self.checkeredSubViews = @[].mutableCopy;

    for (NSInteger i = 0; i < NUM_ROWS; i++) {
        for (NSInteger j = 0; j < NUM_COLUMNS; j++) {
            CGFloat x = 0;
            CGFloat y = 0;
            BOOL filled = YES;
            CheckeredView *checkeredView = [[CheckeredView alloc] initWithFrame:CGRectMake(x, y, WIDTH, HEIGHT)];
            checkeredView.translatesAutoresizingMaskIntoConstraints = NO;
            checkeredView.filled = filled;
            [self.checkeredSubViews addObject:checkeredView];
            [self addSubview:checkeredView];
        }
    }

    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
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
