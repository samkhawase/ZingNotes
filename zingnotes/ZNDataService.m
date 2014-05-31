//
//  ZNDataService.m
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import "ZNDataService.h"
#import "ZNAppDelegate.h"

@interface ZNDataService()

@end

@implementation ZNDataService

// singleton FTW
+ (ZNDataService *)sharedInstance{

    static ZNDataService* _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ZNDataService alloc]init];
    });
    return _sharedInstance;
}

- (Boolean)insertBootstrapData{
    
    ZNAppDelegate* appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSArray *notes = @[
                       @{@"id":@1, @"text": @"First note"},
                       @{@"id":@2, @"text": @"Secon note with a link to http://www.google.de"},
                       @{@"id":@3, @"text": @"Third note"},
                       @{@"id":@4, @"text": @"Fourth note"},
                       @{@"id":@5, @"text": @"Fifth note with an email adress to jakob@mbraceapp.com"}, @{@"id":@6, @"text": @"6th note"},
                       @{@"id":@6, @"text": @"6th note updated"},
                       @{@"id":@7, @"text": @"7th note"},
                       @{@"id":@8, @"text": @"8th note"},
                       @{@"id":@9, @"text": @"9th note"},
                       @{@"id":@10, @"text": @"10th note"},
                       @{@"id":@11, @"text": @"11th note"},
                       @{@"id":@12, @"text": @"12th note"},
                       @{@"id":@13, @"text": @"13th note"},
                       @{@"id":@14, @"text": @"14th note"},
                       @{@"id":@15, @"text": @"get mbrace at http://www.getmbrace.com"},
                       @{@"id":@16, @"text": @"16th note"},
                       @{@"id":@17, @"text": @"17th note"},
                       @{@"id":@18, @"text": @"18th note"},
                       @{@"id":@19, @"text": @"19th note"},
                       @{@"id":@20, @"text": @"20th note"},
                       @{@"id":@21, @"text": [NSNull null]},
                       @{@"id":@22, @"text": @"22th note"},
                       @{@"id":@23, @"text": @"23th note"},
                       @{@"id":@24, @"text": @"Visit www.mbraceapp.com"},
                       @{@"id":@25, @"text": @"25th note"},
                       @{@"id":@26, @"text": @"Note that is a little bit longer than all the other notes because of consiting of some strings that are useless and take a lot of space"},
                       @{@"id":@27, @"text": @"27th note"},
                       @{@"id":@28, @"text": @"28th note"}, @{@"id":@29, @"text": @"29th note"},
                       @{@"id":@30, @"text": @"another email to lukas@mbraceapp.com"}, @{@"id":@31, @"text": @"31th note"},
                       @{@"id":@32, @"text": @"32th note"},
                       @{@"id":@33, @"text": @"33th note"},
                       @{@"id":@34, @"text": @"almost at the end note"}, @{@"id":@35, @"text": @"Last note note"}, @{@"id":@12, @"text": @"Updated 12th note"}
                       ];
    
    [notes enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL *stop) {

        NSNumber* noteId = [obj valueForKeyPath:@"id"];
        
        NSString* noteText = [[NSString alloc] init];
        
        if ([[obj valueForKey:@"text"] isKindOfClass:[NSNull class]]) {
            noteText = @"";
        } else
            noteText = [obj valueForKeyPath:@"text"];
        
        ZNNote* thisNote  = [[ZNNote alloc]initWithNoteId:noteId andNoteText:noteText];
        
        NSManagedObject* aNote;
        aNote = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:context];
        
        [aNote setValue:thisNote.noteId forKeyPath:@"noteId"];
        [aNote setValue:thisNote.noteText forKeyPath:@"noteText"];
        
        NSError* error;
        
        NSLog(@"saved? %hhd",[context save:&error]);
    }];
    
    return true;
}

- (NSArray *)retriveAllNotes{
    return [[NSArray alloc] init];
}

- (Boolean)insertANewNote:(ZNNote *)note{
    
    return false;
}

- (ZNNote *)retreiveANote:(NSString *)noteId{
    
    return nil;
}

- (Boolean)updateANote:(NSString *)noteId{
    return false;
}

-(Boolean)deleteANote:(NSString *)noteId{
    return false;
}

@end
