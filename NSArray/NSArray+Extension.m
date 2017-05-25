//
//  NSArray+Extension.m
//  AccountManager
//
//  Created by Eric on 16/8/26.
//  Copyright © 2016年 ericoda. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)
+ (NSArray *)sameElementsBetweenArrayA:(NSArray *)arrayA arrayB:(NSArray *)arrayB {
    if (!(arrayA && arrayB)) {
        NSLog(@"error!!\nfunction:%s\nline:%d",__FUNCTION__,__LINE__);
        return nil;
    }
    
    arrayA = [arrayA filtSameElements];
    arrayB = [arrayB filtSameElements];
    
    NSMutableArray *result = [NSMutableArray new];
    
    for (id obj in arrayA) {
        if ([arrayB containsObject:obj]) {
            [result addObject:obj];
        }
    }
    
    return result;
}

- (NSArray *)filtSameElements {
    if (self == nil || self.count == 0) {
        NSLog(@"error!!\nfunction:%s\nline:%d",__FUNCTION__,__LINE__);
        return nil;
    }
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *tmpArr = self.mutableCopy;
    
    do {
        [result addObject:tmpArr[0]];
        [tmpArr removeObject:tmpArr[0]];
    } while (tmpArr.count > 0);
    
    return result;
}

@end
