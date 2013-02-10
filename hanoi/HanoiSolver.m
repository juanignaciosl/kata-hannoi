//
//  HanoiSolver.m
//  hanoi
//
//  Created by Juan Ignacio Sánchez Lara on 09/02/13.
//  Copyright (c) 2013 juanignaciosl. All rights reserved.
//

#import "HanoiSolver.h"

@implementation HanoiSolver

- (NSArray*) solve:(int) discs {
    return [self solve: discs from:@"origin" to:@"destination" usingAux:@"aux"];
}

- (NSArray*) solve: (int) discs from: (NSString*) origin to: (NSString*) destination usingAux: (NSString*)aux {
    if(discs == 1) {
        return  @[[self move:discs from: origin to: destination]];
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    [result addObjectsFromArray: [self solve: discs - 1 from: origin to: aux usingAux: destination]];
    [result addObject: [self move: discs from: origin to: destination]];
    [result addObjectsFromArray: [self solve: discs - 1 from: aux to: destination usingAux: origin]];
    
    return result;
}

- (NSString*) move: (int) disc from: (NSString*) origin to: (NSString*) destination {
    return [NSString stringWithFormat: @"Move disc %d from %@ to %@", disc, origin, destination];
}

@end
