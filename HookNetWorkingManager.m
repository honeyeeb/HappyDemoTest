//
//  HookNetWorkingManager.m
//  HappyDemoTestDylib
//
//  Created by honeyeeb on 2020/8/26.
//

#import "HookNetWorkingManager.h"
#import <CaptainHook/CaptainHook.h>

@interface NetWorkingManager : NSObject

+ (id)makeArray:(id)arg1;
+ (id)makeDict:(id)arg1;
+ (id)signParam:(id)arg1;
+ (id)signUrl:(id)arg1 urlParam:(id)arg2 signType:(unsigned long long)arg3;

@end

@interface NSString (HappyTest)

- (id)md5Encode;

@end

CHDeclareClass(NetWorkingManager)
CHDeclareClass(NSString)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

// request sign
CHClassMethod1(id, NetWorkingManager, makeDict, id, arg1) {
    NSLog(@"makeDic param:\n%@ ", arg1);
    id result = CHSuper1(NetWorkingManager, makeDict, arg1);
    NSLog(@" makeDic result:\n%@ ", result);
    return result;
}

CHClassMethod1(id, NetWorkingManager, makeArray, id, arg1) {
    NSLog(@"makeArray param:\n%@ ", arg1);
    id result = CHSuper1(NetWorkingManager, makeArray, arg1);
    NSLog(@"makeArray result:\n%@ ", result);
    return result;
}

CHClassMethod1(id, NetWorkingManager, signParam, id, arg1) {
    NSLog(@" %s \nparam: %@", __FUNCTION__, arg1);
    
    id result = CHSuper1(NetWorkingManager, signParam, arg1);
    NSLog(@"result:%@", result);
    return result;
}

CHClassMethod3(id, NetWorkingManager, signUrl, id, arg1, urlParam, id, arg2, signType, int, arg3) {
    
    NSLog(@" %s \nurl:%@ \nparam:%@ \ntype:%d ", __FUNCTION__, arg1, arg2, arg3);
    id result = CHSuper3(NetWorkingManager, signUrl, arg1, urlParam, arg2, signType, arg3);
    NSLog(@"result:%@", result);
    return result;
}

// md5 encode
CHMethod0(id, NSString, md5Encode) {
    NSLog(@"sign md5 befor: %@", self);
    id result = CHSuper0(NSString, md5Encode);
    NSLog(@"sign md5 after: %@", result);
    return result;
}

CHConstructor{
    
    CHLoadLateClass(NetWorkingManager);
    CHClassHook1(NetWorkingManager, makeDict);
    CHClassHook1(NetWorkingManager, makeArray);
    CHClassHook1(NetWorkingManager, signParam);
    CHClassHook3(NetWorkingManager, signUrl, urlParam, signType);
    
    CHLoadLateClass(NSString);
    CHHook0(NSString, md5Encode);
}

@implementation HookNetWorkingManager

@end
