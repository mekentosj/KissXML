#import <Foundation/Foundation.h>

@interface NSString (DDXML)

/**
 * xmlChar - A basic replacement for char, a byte in a UTF-8 encoded string.
**/
- (const unsigned char *)xmlChar;

- (NSString *)stringByTrimming;

@end
