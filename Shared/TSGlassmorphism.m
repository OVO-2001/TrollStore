#import "TSGlassmorphism.h"

static NSInteger const TSGlassBackgroundTag = 923514;

@implementation TSGlassmorphism

+ (UIBlurEffect *)_glassBlurEffect
{
	return [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
}

+ (UIVisualEffectView *)_glassBackgroundViewWithFrame:(CGRect)frame
{
	UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[self _glassBlurEffect]];
	blurView.frame = frame;
	blurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	blurView.tag = TSGlassBackgroundTag;

	UIView *tintView = [[UIView alloc] initWithFrame:blurView.bounds];
	tintView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	tintView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.12];
	tintView.userInteractionEnabled = NO;
	[blurView.contentView addSubview:tintView];

	return blurView;
}

+ (void)applyGlobalAppearance
{
	UIBlurEffect *blurEffect = [self _glassBlurEffect];

	UINavigationBarAppearance *navAppearance = [UINavigationBarAppearance new];
	[navAppearance configureWithTransparentBackground];
	navAppearance.backgroundEffect = blurEffect;
	navAppearance.backgroundColor = [[UIColor systemBackgroundColor] colorWithAlphaComponent:0.2];
	navAppearance.shadowColor = [[UIColor whiteColor] colorWithAlphaComponent:0.15];

	UINavigationBar *navBar = [UINavigationBar appearance];
	navBar.standardAppearance = navAppearance;
	navBar.scrollEdgeAppearance = navAppearance;
	navBar.compactAppearance = navAppearance;

	UITabBarAppearance *tabAppearance = [UITabBarAppearance new];
	[tabAppearance configureWithTransparentBackground];
	tabAppearance.backgroundEffect = blurEffect;
	tabAppearance.backgroundColor = [[UIColor systemBackgroundColor] colorWithAlphaComponent:0.2];
	tabAppearance.shadowColor = [[UIColor whiteColor] colorWithAlphaComponent:0.15];

	UITabBar *tabBar = [UITabBar appearance];
	tabBar.standardAppearance = tabAppearance;
	if (@available(iOS 15.0, *))
	{
		tabBar.scrollEdgeAppearance = tabAppearance;
	}
}
a
+ (void)applyToView:(UIView *)view
{
	if([view viewWithTag:TSGlassBackgroundTag])
	{
		return;
	}

	view.backgroundColor = [UIColor clearColor];
	UIVisualEffectView *glassView = [self _glassBackgroundViewWithFrame:view.bounds];
	[view insertSubview:glassView atIndex:0];
}

+ (void)applyToTableView:(UITableView *)tableView
{
	if([tableView.backgroundView viewWithTag:TSGlassBackgroundTag])
	{
		return;
	}

	tableView.backgroundColor = [UIColor clearColor];
	tableView.backgroundView = [self _glassBackgroundViewWithFrame:tableView.bounds];
}

@end
