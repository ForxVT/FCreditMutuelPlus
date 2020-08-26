#import "FCMTimesPlusPref.h"

NSString *fcmLocalizedString(NSString *string)
{
    return [[NSBundle bundleWithPath:kPreferenceBundlePath] localizedStringForKey:string value:string table:nil];
}