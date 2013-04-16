# vero-ios

The simplest way to get up and running with Vero with your existing XCode project is by using our iOS API wrapper.

## Getting started

To get started, you will need to add the following dependancies.

1) Add the following third party libraries

- [asi-http-request](http://allseeing-i.com/ASIHTTPRequest/) - for instructions on adding to your project, see [setup instructions](http://allseeing-i.com/ASIHTTPRequest/Setup-instructions)
- [JSONKit](https://github.com/johnezang/JSONKit)

2) Copy Vero.h and Vero.m to your XCode project

## Using the Vero API

Interacting with the Vero API using our wrapper object is super simple. Here are some common scenarios:

**Example: Track an event when a user signs up from your app**
```objectivec
#import "Vero.h"

- (void) doSomething {
  Vero *vero = [[Vero alloc] init];
  vero.authToken = @"yourVeroAuthToken";

  NSDictionary* me = [NSDictionary dictionaryWithObjectsAndKeys:
                     @"james@getvero.com", @"id",
                     [NSNumber numberWithBool:true], @"awesome", nil];
  NSDictionary* data = [NSDictionary dictionaryWithObjectsAndKeys: @"iphone", @"source", nil];
  
  [vero eventsTrack:@"Signed up" identity:me data:data developmentMode:false];
}
```

**Example: Track or update a user's age from your app**
```objectivec
#import "Vero.h"

- (void) doSomething {
  Vero *vero = [[Vero alloc] init];
  vero.authToken = @"yourVeroAuthToken";

  NSDictionary* me = [NSDictionary dictionaryWithObjectsAndKeys:
                     @"james@getvero.com", @"id",
                     [NSNumber numberWithInt:25], @"age", nil];
  
  [vero usersTrack:@"james@getvero" email:nil data:me developmentMode:false];
}
```

**Example: Edit an existing user's age from your app**

Note: this operation will not create a new user if they do not already exist
```objectivec
#import "Vero.h"

- (void) doSomething {
  Vero *vero = [[Vero alloc] init];
  vero.authToken = @"yourVeroAuthToken";

  NSDictionary* me = [NSDictionary dictionaryWithObjectsAndKeys:
                     @"james@getvero.com", @"id",
                     [NSNumber numberWithInt:25], @"age", nil];
  
  [vero usersEdit:@"james@getvero" changes:me developmentMode:false];
}
```

**Example: Tag an existing user with "VIP" from your app**
```objectivec
#import "Vero.h"

- (void) doSomething {
  Vero *vero = [[Vero alloc] init];
  vero.authToken = @"yourVeroAuthToken";

  NSArray* tags = [NSArray arrayWithObject:@"VIP"];
  
  [vero usersTagsEdit:@"james@getvero" add:tags remove:nil developmentMode:false];
}
```

**Example: Unsubscribe a user from Vero emails using your app**
```objectivec
#import "Vero.h"

- (void) doSomething {
  Vero *vero = [[Vero alloc] init];
  vero.authToken = @"yourVeroAuthToken";
  
  [vero usersUnsubscribe:@"james@getvero"];
}
```

For more indepth information on each of the supported APIs, see our API reference: [Events API](https://github.com/getvero/vero-api/blob/master/sections/api/events.md) and [User API](https://github.com/getvero/vero-api/blob/master/sections/api/users.md).
