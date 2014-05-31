//
//  ZNNote.h
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZNNote : NSObject

- (id)initWithNoteId:(NSNumber*)noteId andNoteText:(NSString*)noteText;

@property (strong, nonatomic) NSNumber* noteId;
@property (strong, nonatomic) NSString* noteText;

@end
