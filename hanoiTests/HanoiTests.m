//
//  hanoiTests.m
//  hanoiTests
//
//  Created by Juan Ignacio Sánchez Lara on 08/02/13.
//  Copyright (c) 2013 juanignaciosl. All rights reserved.
//

#import "HanoiTests.h"
#import "HanoiSolver.h"

@interface HanoiTests()

@property HanoiSolver* solver;

@end

@implementation HanoiTests

@synthesize solver;

- (void)setUp
{
    [super setUp];
    
    solver = [[HanoiSolver alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void) testOneDiscSolution
{
    STAssertTrue([@[@"Move disc 1 from origin to destination"] isEqualToArray:[solver solve: 1]], nil);
}

- (void) testTwoDiscsSolution
{
    NSArray* expected = @[@"Move disc 1 from origin to aux",
        @"Move disc 2 from origin to destination",
        @"Move disc 1 from aux to destination"];
    STAssertTrue([expected isEqualToArray:[solver solve: 2]], nil);
}

- (void) testThreeDiscsSolution
{
    NSArray* expected = @[
    @"Move disc 1 from origin to destination",
    @"Move disc 2 from origin to aux",
    @"Move disc 1 from destination to aux",
    @"Move disc 3 from origin to destination",
    @"Move disc 1 from aux to origin",
    @"Move disc 2 from aux to destination",
    @"Move disc 1 from origin to destination"];
    STAssertTrue([expected isEqualToArray:[solver solve: 3]], nil);
}

- (void) testFourDiscsSolution
{
    NSArray* expected = @[
    @"Move disc 1 from origin to aux",
    @"Move disc 2 from origin to destination",
    @"Move disc 1 from aux to destination",
    @"Move disc 3 from origin to aux",
    @"Move disc 1 from destination to origin",
    @"Move disc 2 from destination to aux",
    @"Move disc 1 from origin to aux",
    @"Move disc 4 from origin to destination",
    @"Move disc 1 from aux to destination",
    @"Move disc 2 from aux to origin",
    @"Move disc 1 from destination to origin",
    @"Move disc 3 from aux to destination",
    @"Move disc 1 from origin to aux",
    @"Move disc 2 from origin to destination",
    @"Move disc 1 from aux to destination",
    ];
    STAssertTrue([expected isEqualToArray:[solver solve: 4]], nil);
}


@end
