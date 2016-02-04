#import "DDXMLDocument.h"

@interface DDXMLDocument (HTML)

- (id)initWithHTMLString:(NSString *)string
                 options:(NSUInteger)options
                   error:(NSError **)error;

- (id)initWithHTMLData:(NSData *)data
               options:(NSUInteger)options
                 error:(NSError **)error;

@end
