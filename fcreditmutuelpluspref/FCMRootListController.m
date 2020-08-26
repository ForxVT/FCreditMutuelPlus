#import "FCMRootListController.h"
#import "FCMTimesPlusPref.h"
#import <dlfcn.h>

static int (*BKSTerminateApplicationForReasonAndReportWithDescription)(NSString *bundleID, int reasonID, bool report, NSString *description);

@implementation FCMRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)viewDidLoad {
    [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:fcmLocalizedString(@"APPLY") style:UIBarButtonItemStylePlain target:self action:@selector(apply)]];

    [super viewDidLoad];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
    	return 20.f;
    }

    return [super tableView:tableView heightForHeaderInSection:section];
}

- (void)apply {
	void *bk = dlopen("/System/Library/PrivateFrameworks/BackBoardServices.framework/BackBoardServices", RTLD_LAZY);

	if (bk) {
		BKSTerminateApplicationForReasonAndReportWithDescription = (int (*)(NSString*, int, bool, NSString*))dlsym(bk, "BKSTerminateApplicationForReasonAndReportWithDescription");
	}

	if (BKSTerminateApplicationForReasonAndReportWithDescription) {
		BKSTerminateApplicationForReasonAndReportWithDescription(@"ei.cm.release", 1, 0, @"[FCreditMutuelPlus] Killed Credit Mutuel to reload preferences.");
	}
}

- (void)openSourceCodePage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ForxVT/FCreditMutuelPlus"] options:@{} completionHandler:nil];
}

- (void)openTwitterPage
{
	if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=ForxVT"] options:@{} completionHandler:nil];
	} else {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/ForxVT"] options:@{} completionHandler:nil];
	}
}

- (void)openRedditPage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.reddit.com/user/ForxVT"] options:@{} completionHandler:nil];
}

- (void)openGithubPage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ForxVT"] options:@{} completionHandler:nil];
}

- (void)openPaypalPage
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/hkindel"] options:@{} completionHandler:nil];
}

@end