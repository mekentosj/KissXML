//
//  DDXMLDocument+MTFoundationAdditions.m
//  MTFoundation-iOS
//
//  Created by Simon Maddox on 05/04/2013.
//  Copyright (c) 2013 Mekentosj. All rights reserved.
//

#import "DDXMLDocument+MTFoundationAdditions.h"
#import "DDXML+HTML.h"
#import <libxml/HTMLparser.h>

@implementation DDXMLDocument (MTFoundationAdditions)

- (instancetype)initWithContentsOfURL:(NSURL *)url options:(NSUInteger)mask tidy:(BOOL)tidy error:(NSError *__autoreleasing *)error
{
    NSData *data = [NSData dataWithContentsOfURL:url
                                         options:NSDataReadingMappedIfSafe
                                           error:error];
    if (!data)
        return nil;

    if(tidy)
        mask = mask | HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR;
        
    return [[NSXMLDocument alloc] initWithHTMLData:data
                                           options:mask
                                             error:error];
}

- (instancetype)initWithXMLString:(NSString *)string options:(NSUInteger)mask tidy:(BOOL)tidy error:(NSError **)error
{
	if(tidy)
		mask = mask | HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR;

	return [[NSXMLDocument alloc] initWithHTMLData:[string dataUsingEncoding:NSUTF8StringEncoding]
										   options:mask
											 error:error];
}

- (instancetype)initWithData:(NSData *)data options:(NSUInteger)mask tidy:(BOOL)tidy error:(NSError **)error
{
    if(tidy)
        mask = mask | HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR;

    return [[NSXMLDocument alloc] initWithHTMLData:data
                                           options:mask
                                             error:error];
}


- (instancetype)initWithContentsOfURL:(NSURL *)url options:(NSUInteger)mask error:(NSError *__autoreleasing *)error
{
    NSData *data = [NSData dataWithContentsOfURL:url
                                         options:NSDataReadingMappedIfSafe
                                           error:error];
    
    // FIXME: Get rid of this workaround to libxml's treatment of the default namespace for elements, once possible.
	NSMutableString *xmlString = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	[xmlString replaceOccurrencesOfString:@"xmlns=" withString:@"fake=" options:0 range:NSMakeRange(0, [xmlString length])];

    if (!data)
        return nil;

    return [self initWithData:[xmlString dataUsingEncoding:NSUTF8StringEncoding]
                      options:mask
                        error:error];
}

- (void)setRootNode:(DDXMLNode *)node
{
    xmlDocSetRootElement(*(xmlDocPtr *)self->genericPtr, *(xmlNodePtr *)node->genericPtr);
    node->owner = self;
}

- (instancetype)initWithRootElement:(DDXMLNode *)rootElement
{
    if (self = [super init])
    {
        [self setRootNode:rootElement];
    }
    
    return self;
}

@end
