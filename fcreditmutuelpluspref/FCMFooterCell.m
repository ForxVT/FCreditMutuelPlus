#import "FCMFooterCell.h"
#import "FCMTimesPlusPref.h"

@implementation FCMFooterCell
	- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
		self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fcmFooterCell" specifier:specifier];

		if (self) {
			_copyrightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 42)];
			_copyrightLabel.text = [NSString stringWithFormat:@"\u00A9 Hugo Kindel 2020 - FCréditMutuel+ 1.0.0\n%@ \u00A9 Crédit Mutuel 2020", fcmLocalizedString(@"CM_CP")];
			_copyrightLabel.font = [UIFont systemFontOfSize:12.0f];
			_copyrightLabel.lineBreakMode = NSLineBreakByWordWrapping;
			_copyrightLabel.numberOfLines = 2;
			[_copyrightLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
			_copyrightLabel.textAlignment =  NSTextAlignmentCenter;
			
			[self addSubview:_copyrightLabel];
		}

		return self;
	}

	- (CGFloat)preferredHeightForWidth:(CGFloat)width {
		return 40.f;
	}

@end
