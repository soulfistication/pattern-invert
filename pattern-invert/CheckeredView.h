//
//  CheckeredView.h
//  pattern-invert
//
//  Created by Iván Almada on 2/20/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CheckeredView : UIView

@property (nonatomic, assign, getter=isFilled) BOOL filled;

- (void)toggleColor;

@end

NS_ASSUME_NONNULL_END
