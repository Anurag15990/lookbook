//
//  UIImageViewObjectiveCBridge.h
//  lookbook
//
//  Created by Anurag Agnihotri on 09/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

#import<UIKit/UIKit.h>

typedef void(^ImageCompletionBlock) (UIImage *image, NSError *error);

@interface UIImageView (ObjectiveCBridge)

-(void)setImageWithUrl:(NSString *)urlString completed:(ImageCompletionBlock)completedBlock;

+(BOOL) cachedImageExistsForURL:(NSString *)url;

@end