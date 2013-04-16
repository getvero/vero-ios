# vero-ios

The simplest way to get up and running with Vero with your existing XCode project is by using our iOS API wrapper.

## Getting started

To get started, you will need to add the following dependancies.

1) Add the following third party libraries

- [asi-http-request](http://allseeing-i.com/ASIHTTPRequest/) - for instructions on adding to your project, see [setup instructions](http://allseeing-i.com/ASIHTTPRequest/Setup-instructions)
- [JSONKit](https://github.com/johnezang/JSONKit)

2) Copy Vero.h and Vero.m to your XCode project

## Using the Vero API

Interacting with the Vero API using our wrapper object is super simple. For example, to track an event when a user signs up to your service.

```objectivec
#import "Vero.h"

- (void) doSomething {
  Vero *vero = [[Vero alloc] init];
  vero.authToken = @"yourVeroAuthToken";

  NSDictionary* me = [NSDictionary dictionaryWithObjectsAndKeys:
                     @"james@getvero.com", @"id",
                     [NSNumber numberWithBool:true], @"awesome", nil];
  NSDictionary* data = [NSDictionary dictionaryWithObjectsAndKeys: @"MonkeyMagic", @"appName", nil];
  
  [vero eventsTrack:@"Signed up" identity:me data:data developmentMode: false];
}
```

For comprohensive list of supported APIs, see [Events API](https://github.com/getvero/vero-api/blob/master/sections/api/events.md) and [User API](https://github.com/getvero/vero-api/blob/master/sections/api/users.md).
