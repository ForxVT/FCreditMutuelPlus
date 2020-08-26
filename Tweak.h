#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#define kIdentifier @"com.forx.creditmutuelplus"
#define kSettingsChangedNotification (CFStringRef)@"com.forx.creditmutuelplus/preferences.changed"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.forx.creditmutuelpluspref.plist"

@interface NSUserDefaults (Tweak_Category)

- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;

@end
