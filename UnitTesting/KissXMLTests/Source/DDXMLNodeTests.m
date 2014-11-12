//
//  DDXMLNodeTests.m
//  KissXML
//
//  Created by James Valaitis on 11/11/2014.
//
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "DDXML.h"

@interface DDXMLNodeTests : XCTestCase


@property (nonatomic, strong) NSXMLDocument *NSXMLDocument;
@property (nonatomic, strong) DDXMLDocument *DDXMLDocument;

@end

@implementation DDXMLNodeTests

#pragma mark - Set Up

- (void)setUp
{
    [super setUp];
	
	self.DDXMLDocument= [[DDXMLDocument alloc] initWithXMLString:@"<Test/>" options:kNilOptions error:nil];
	
	NSXMLElement *NSRootElement = [[NSXMLElement alloc] initWithName:@"Test"];
	DDXMLElement *DDRootElement = self.DDXMLDocument.rootElement;
	
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
	
	NSXMLNode *NSTextNode = [NSXMLNode textWithStringValue:@"TestTextValueA"];
	DDXMLNode *DDTextNode = [DDXMLNode textWithStringValue:@"TestTextValueA"];
	
	[NSRootElement addChild:NSTextNode];
	[DDRootElement addChild:DDTextNode];
	
	self.NSXMLDocument= [[NSXMLDocument alloc] initWithRootElement:NSRootElement];
}

- (void)tearDown
{
	self.NSXMLDocument = nil;
	self.DDXMLDocument = nil;
	
    [super tearDown];
}

#pragma mark - Property Tests

- (void)testElementName
{
	DDXMLElement *testRootElement = self.DDXMLDocument.rootElement;
	NSXMLElement *realRootElement = self.NSXMLDocument.rootElement;
	
	NSString *testName = testRootElement.name;
	NSString *realName = realRootElement.name;
	
	XCTAssertEqualObjects(testName, realName, @"DDXLElement name (%@) should be equal to NSXMLElement name (%@).", testName, realName);
}

- (void)testNodeName
{
	DDXMLElement *testRootElement = self.DDXMLDocument.rootElement;
	NSXMLElement *realRootElement = self.NSXMLDocument.rootElement;
	
	DDXMLNode *testAttribute = testRootElement.attributes[0];
	NSXMLNode *realAttribute = realRootElement.attributes[0];
	
	NSString *testName = testAttribute.name;
	NSString *realName = realAttribute.name;
	
	XCTAssertEqualObjects(testName, realName, @"DDXLNode name (%@) should be equal to NSXMLNode name (%@).", testName, realName);
}

- (void)testTextNodeName
{
	DDXMLElement *testRootElement = self.DDXMLDocument.rootElement;
	NSXMLElement *realRootElement = self.NSXMLDocument.rootElement;
	
	DDXMLNode *testNode = testRootElement.children.lastObject;
	NSXMLNode *realNode = realRootElement.children.lastObject;
	
	NSString *testName = testNode.name;
	NSString *realName = realNode.name;
	
	XCTAssertEqualObjects(testName, realName, @"DDXLNode name (%@) should be equal to NSXMLNode name (%@).", testName, realName);
}

@end