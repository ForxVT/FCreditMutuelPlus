#import "Tweak.h"

static BOOL _settingsGeneralEnable = YES;
static void *_observer = NULL;
NSDictionary *_prefs = nil;

static void reloadPreferences() {
	_prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
}

static BOOL boolValueForKey(NSString *key, BOOL defaultValue) {
	return (_prefs && [_prefs objectForKey:key]) ? [[_prefs objectForKey:key] boolValue] : defaultValue;
}

static void preferencesChanged() {
	CFPreferencesAppSynchronize((CFStringRef)kIdentifier);
	reloadPreferences();

	_settingsGeneralEnable = boolValueForKey(@"GENERAL_ENABLE", YES);
}

%hook EITestRunner

- (bool)isJailbroken {
	return NO;
}

%end

%ctor {
	preferencesChanged();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), &_observer, (CFNotificationCallback)preferencesChanged, kSettingsChangedNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

	if (!_settingsGeneralEnable) {
		return;
	}

	%init();
}
