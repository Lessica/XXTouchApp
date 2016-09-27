//
//  XXCodeMakerService.m
//  XXTouchApp
//
//  Created by Zheng on 9/27/16.
//  Copyright © 2016 Zheng. All rights reserved.
//

#import "XXCodeMakerService.h"
#import "XXApplicationListTableViewController.h"
#import "XXCodeBlocksViewController.h"

@implementation XXCodeMakerService

+ (void)pushToMakerWithCodeBlockModel:(XXCodeBlockModel *)model controller:(UIViewController *)controller {
    NSString *code = model.code;
    if ([code containsString:@"@bid@"]) {
        XXApplicationListTableViewController *vc = [controller.storyboard instantiateViewControllerWithIdentifier:kXXApplicationListTableViewControllerStoryboardID];
        vc.codeBlock = [XXCodeBlockModel modelWithTitle:[model.title mutableCopy] code:[model.code mutableCopy] type:model.type]; // Copy
        [controller.navigationController pushViewController:vc animated:YES];
    } else {
        model.code = [model.code stringByReplacingOccurrencesOfString:@"\\@" withString:@"@"]; // unescape
        XXCodeBlocksViewController *codeBlockController = (XXCodeBlocksViewController *)controller.navigationController.viewControllers[0]; // Root View Controller
        [codeBlockController replaceTextInputSelectedRangeWithString:model.code];
        [controller.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end