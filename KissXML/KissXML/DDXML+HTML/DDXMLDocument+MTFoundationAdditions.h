//
//  DDXMLDocument+MTFoundationAdditions.h
//  MTFoundation-iOS
//
//  Created by Simon Maddox on 05/04/2013.
//  Copyright (c) 2013 Mekentosj. All rights reserved.
//

#import "DDXMLDocument.h"

@interface DDXMLDocument (MTFoundationAdditions)

- (instancetype)initWithContentsOfURL:(NSURL *)url options:(NSUInteger)mask tidy:(BOOL)tidy error:(NSError *__autoreleasing *)error;

- (instancetype)initWithContentsOfURL:(NSURL *)url options:(NSUInteger)mask error:(NSError **)error;

- (instancetype)initWithXMLString:(NSString *)string options:(NSUInteger)mask tidy:(BOOL)tidy error:(NSError **)error;

- (instancetype)initWithData:(NSData *)data options:(NSUInteger)mask tidy:(BOOL)tidy error:(NSError **)error;

- (instancetype)initWithRootElement:(DDXMLNode *)rootElement;

@end
