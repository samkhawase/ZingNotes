//
//  ZNNote.m
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import "ZNNote.h"



@implementation ZNNote

// lazy initialization

- (NSString *)noteId{
    if (nil == _noteId) {
        _noteId = [[NSString alloc]init];
    }
    return  _noteId;
}

- (NSString *)noteText{
    if (nil == _noteText) {
        _noteText = [[NSString alloc]init];
    }
    return _noteText;
}

@end
