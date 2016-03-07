# vero-ios

This is an old library that suggests an approach for running Vero from within an existing XCode project. It is a thin wrapper for Vero's API. The full documentation for this API can be found [here](http://developers.getvero.com/?bash).

Alternatively, we would recommend using [Segment.com's](https://segment.com) [iOs Library](https://segment.com/docs/libraries/ios/).

## Getting started

Vero support iOS5 and above. 

Copy Vero.h and Vero.m to your XCode project

```objectivec
	Vero *vero = [Vero shared];
	[vero setAuthToken:@"yourVeroAuthToken"];
	vero.debug = YES;
```

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
