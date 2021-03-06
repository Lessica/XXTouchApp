//
//  XXTUIActivity.m
//  XXTouchApp
//
//  Created by Zheng on 17/03/2017.
//  Copyright © 2017 Zheng. All rights reserved.
//

#import "XXTUIActivity.h"
#import "XXTUIListController.h"
#import "XXEmptyNavigationController.h"

@implementation XXTUIActivity

+ (NSArray <NSString *> *)supportedExtensions {
    return @[ @"xxtu" ];
}

- (NSString *)activityType
{
    return @"com.xxtouch.activity-appui";
}

- (NSString *)activityTitle
{
    return NSLocalizedString(@"Render as AppUI", nil);
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"activity-appui"];
}

- (UIViewController *)activityViewController {
    XXTUIListController *uiListController = [[XXTUIListController alloc] init];
    uiListController.filePath = [self.fileURL path];
    uiListController.activity = self;
    XXEmptyNavigationController *navController = [[XXEmptyNavigationController alloc] initWithRootViewController:uiListController];
    return navController;
}

- (void)performActivityWithController:(UIViewController *)controller
{
    [super performActivityWithController:controller];
    [controller.navigationController presentViewController:self.activityViewController animated:YES completion:nil];
}

@end
