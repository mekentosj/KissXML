//
//  DDXMLNodeTests.m
//  KissXML
//
//  Created by James Valaitis on 11/11/2014.
//
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "DDXMLDocument.h"

@interface DDXMLNodeTests : XCTestCase


@property (nonatomic, strong) NSXMLDocument *NSXMLDocument;
@property (nonatomic, strong) DDXMLDocument *DDXMLDocument;

@end

@implementation DDXMLNodeTests

- (void)setUp
{
    [super setUp];
	
	NSXMLElement *NSRootElement = [[NSXMLElement alloc] initWithName:@"Test"];
	DDXMLElement *DDRootElement = [[DDXMLElement alloc] initWithName:@"Test"];
	
	[NSRootElement addAttribute:[NSXMLNode attributeWithName:@"TestAttributeA" stringValue:@"TestValueA"]];
	[DDRootElement addAttribute:[DDXMLNode attributeWithName:@"TestAttributeA" stringValue:@"TestValueA"]];
	
	[NSRootElement addAttribute:[NSXMLNode attributeWithName:@"TestAttributeB" stringValue:@"TestValueB"]];
	[DDRootElement addAttribute:[DDXMLNode attributeWithName:@"TestAttributeB" stringValue:@"TestValueB"]];
	
	[NSRootElement addAttribute:[NSXMLNode attributeWithName:@"TestAttributeC" stringValue:@"TestValueC"]];
	[DDRootElement addAttribute:[DDXMLNode attributeWithName:@"TestAttributeC" stringValue:@"TestValueC"]];
	
	NSXMLElement *NSChildElementA = [[NSXMLElement alloc] initWithName:@"TestChildElementA"];
	DDXMLElement *DDChildElementA = [[DDXMLElement alloc] initWithName:@"TestChildElementA"];
	
	[NSRootElement addChild:NSChildElementA];
	[DDRootElement addChild:DDChildElementA];
	
	NSXMLElement *NSChildElementB = [[NSXMLElement alloc] initWithName:@"TestChildElementA"];
	DDXMLElement *DDChildElementB = [[DDXMLElement alloc] initWithName:@"TestChildElementA"];
	
	NSChildElementB.stringValue = @"TestChildValue";
	DDChildElementB.stringValue = @"TestChildValue";
	
	[NSChildElementB addAttribute:[NSXMLNode attributeWithName:@"TestChildAttributeA" stringValue:@"TestChildValueA"]];
	[DDChildElementB addAttribute:[DDXMLNode attributeWithName:@"TestChildAttributeA" stringValue:@"TestChildValueA"]];
	
	[NSRootElement addChild:NSChildElementB];
	[DDRootElement addChild:DDChildElementB];
	
	self.NSXMLDocument= [NSXMLDocument documentWithRootElement:NSRootElement];
	self.DDXMLDocument= [DDXMLDocument documentWithRootElement:DDRootElement];
}

- (void)tearDown
{
	
    [super tearDown];
}

@end
