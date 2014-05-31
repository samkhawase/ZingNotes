//
//  ZNNote.m
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import "ZNNote.h"



@implementation ZNNote

- (id)initWithNoteId:(NSNumber*)noteId andNoteText:(NSString*)noteText{
    
    self = [super init];
    
    self.noteId = noteId;
    self.noteText = noteText;
    
    return self;
}


// lazy initialization

- (NSNumber *)noteId{
    if (nil == _noteId) {
        _noteId = [[NSNumber alloc]init];
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
