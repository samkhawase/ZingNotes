//
//  ZNDataService.h
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZNNote.h"

@interface ZNDataService : NSObject

+ (ZNDataService*) sharedInstance;

// public methods

// This init's the app with Bootstrap data
- (Boolean)insertBootstrapData;

// read and get all the notes avilable in store
- (NSArray*)retriveAllNotes;

// insert a new note to the data store
- (Boolean)insertANewNote:(ZNNote*) note;

- (ZNNote*)retreiveANote:(NSString*) noteId;

- (Boolean)updateANote:(NSString*)noteId;

// Delete a note? not sure about that yet
- (Boolean)deleteANote:(NSString*)noteId;

@end
