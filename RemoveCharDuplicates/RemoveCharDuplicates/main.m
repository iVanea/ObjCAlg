//
//  main.m
//  RemoveCharDuplicates
//
//  Created by Timotin Ion on 1/8/19.
//  Copyright © 2019 Timotin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFS.h"
//#include <stdio.h>
//#include <objc/objc.h>

NSString* removeDuplicates(NSString* input){
    NSMutableSet *seenCharacters = [NSMutableSet set];
    NSMutableString *result = [NSMutableString string];
    [input enumerateSubstringsInRange:NSMakeRange(0, input.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        if (![seenCharacters containsObject:substring]) {
            [seenCharacters addObject:substring];
            [result appendString:substring];
        }
    }];
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
    
        NSString *input = @"addbcddaa";
        printf("Initial string: %s \n", [input UTF8String]);
        NSString *result = removeDuplicates(input);
        printf("After removing duplicates:\n%s \n", [result UTF8String]);
        
        BFS *b = [[BFS alloc]init];
//        [b bfsPrint];
    }
    return 0;
}

