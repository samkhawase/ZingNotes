//
//  ZNDataService.m
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import "ZNDataService.h"

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
    
    return false;
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
