#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSGlassmorphism : NSObject
+ (void)applyGlobalAppearance;
+ (void)applyToView:(UIView *)view;
+ (void)applyToTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
