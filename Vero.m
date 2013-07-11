//
//  Vero.m
//  VeroTest
//
//  Created by James Lamont on 16/04/13.
//  Copyright (c) 2013 James Lamont. All rights reserved.
//

#import "Vero.h"

@implementation Vero

@synthesize authToken;

- (void) makeApiCall: (NSString*)url method:(NSString*)method params: (NSDictionary*)params {
    NSURL *veroUrl              = [NSURL URLWithString:url];
    ASIHTTPRequest *request     = [ASIHTTPRequest requestWithURL:veroUrl];
    NSString *jsonString        = [params JSONString];
    NSLog(@"%@ %@ %@", method, url, jsonString);
    
    NSMutableData *requestBody  = [[NSMutableData alloc] initWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setRequestMethod:method];
    [request setPostBody:requestBody];
    
    [request startAsynchronous];
}

// Events

- (void) eventsTrack: (NSString*)eventName identity:(NSDictionary*)userProperties data:(NSDictionary*)data developmentMode:(BOOL)devMode {
    NSString* url = @"https://api.getvero.com/api/v2/events/track.json";
    
    NSDictionary* params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                            eventName,       @"event_name",
                            self.authToken,  @"auth_token",
                            userProperties,  @"identity",
                            devMode,         @"development_mode", nil];
    
    if (data) {
        [params setValue:data forKey:@"data"];
    }
    
    [self makeApiCall:url method:@"POST" params:params];
}

// Users

- (void) usersTrack: (NSString*)userId email:(NSString*)email data:(NSDictionary*)userProperties developmentMode:(BOOL)devMode {
    NSString* url = @"https://api.getvero.com/api/v2/users/track.json";
    
    NSDictionary* params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                            self.authToken, @"auth_token",
                            devMode,        @"development_mode", nil];
    
    if (userId) {
        [params setValue:userId forKey:@"id"];
    }
    if (email) {
        [params setValue:email forKey:@"email"];
    }
    if (userProperties) {
        [params setValue:userProperties forKey:@"data"];
    }
    
    [self makeApiCall:url method:@"POST" params:params];
}

- (void) usersEdit: (NSString*)userId changes:(NSDictionary*)changes developmentMode:(BOOL)devMode {
    NSString* url = @"https://api.getvero.com/api/v2/users/edit.json";
    
    NSDictionary* params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                            self.authToken, @"auth_token",
                            userId,         @"id",
                            changes,        @"changes",
                            devMode,        @"development_mode", nil];
    
    [self makeApiCall:url method:@"PUT" params:params];
}

- (void) usersTagsEdit: (NSString*)userId add:(NSArray*)add remove:(NSArray*)remove developmentMode:(BOOL)devMode {
    NSString* url = @"https://api.getvero.com/api/v2/users/tags/edit.json";
    
    NSDictionary* params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                            self.authToken, @"auth_token",
                            userId,         @"id",
                            devMode,        @"development_mode", nil];
    if (add) {
        [params setValue:add forKey:@"add"];
    }
    if (remove) {
        [params setValue:remove forKey:@"remove"];
    }
    
    [self makeApiCall:url method:@"PUT" params:params];
}

- (void) usersUnsubscribe: (NSString*)userId {
    NSString* url = @"https://api.getvero.com/api/v2/users/unsubscribe.json";
    
    NSDictionary* params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                            self.authToken, @"auth_token",
                            userId,         @"id", nil];
    
    [self makeApiCall:url method:@"POST" params:params];
}

@end