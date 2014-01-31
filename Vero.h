//
//  Vero.h
//  VeroTest
//
//  Created by James Lamont on 16/04/13.
//  Copyright (c) 2013 James Lamont. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vero : NSObject

@property BOOL debug;
@property (strong) NSString* authToken;

- (void) eventsTrack: (NSString*)eventName identity:(NSDictionary*)userProperties data:(NSDictionary*)data developmentMode:(BOOL)devMode;
- (void) usersTrack: (NSString*)userId email:(NSString*)email data:(NSDictionary*)userProperties developmentMode:(BOOL)devMode;
- (void) usersEdit: (NSString*)userId changes:(NSDictionary*)changes developmentMode:(BOOL)devMode;
- (void) usersTagsEdit: (NSString*)userId add:(NSArray*)add remove:(NSArray*)remove developmentMode:(BOOL)devMode;
- (void) usersUnsubscribe: (NSString*)userId;
@end
