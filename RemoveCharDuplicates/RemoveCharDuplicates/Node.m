//
//  Node.m
//  RemoveCharDuplicates
//
//  Created by Timotin Ion on 1/20/19.
//  Copyright © 2019 Timotin. All rights reserved.
//

#import "Node.h"

@implementation Node
@synthesize linkedNodes;
@end

const NSInteger NUM_LINKED_NODES = 2;

NSArray *addDecreasingLinksToNodes(NSArray *nodes)
{
    NSMutableArray *allLinks = [NSMutableArray arrayWithCapacity:[nodes count] / NUM_LINKED_NODES];
    
    NSInteger i;
    for (i = 0; i < [nodes count]; i += NUM_LINKED_NODES)
    {
        Node *link = [[Node alloc] init];
        [allLinks addObject:link];
        
        NSSet *links = [NSSet setWithObject:link];
        
        NSInteger j;
        for (j = i; j < i + NUM_LINKED_NODES; j++)
        {
            ((Node *)[nodes objectAtIndex:j]).linkedNodes = links;
        }
    }
    
    return allLinks;
}

NSArray *addIncreasingLinksToNodes(NSArray *nodes)
{
    NSMutableArray *allLinks = [NSMutableArray arrayWithCapacity:[nodes count] * NUM_LINKED_NODES];
    
    for (Node *node in nodes)
    {
        NSMutableSet *links = [NSMutableSet setWithCapacity:NUM_LINKED_NODES];
        NSInteger i;
        for (i = 0; i < NUM_LINKED_NODES; i++)
        {
            Node *link = [[Node alloc] init] ;
            [links addObject:link];
            [allLinks addObject:link];
        }
        
        node.linkedNodes = links;
    }
    
    return allLinks;
}

void TraverseGraphFromNode(Node *startingNode)
{
    NSDate *startDate = [NSDate date];
    
    NSMutableSet *visitedNodes = [NSMutableSet setWithObject:startingNode];
    NSMutableArray *queue = [NSMutableArray arrayWithObject:startingNode];
    
    while ([queue count] > 0)
    {
        NSMutableSet *newNodes = [((Node *)[queue lastObject]).linkedNodes mutableCopy];
        [newNodes minusSet:visitedNodes];
        
        [visitedNodes unionSet:newNodes];
        [queue replaceObjectsInRange:NSMakeRange(0, 0) withObjectsFromArray:[newNodes allObjects]];
        
        [queue removeLastObject];
    }
    
    NSDate *endDate = [NSDate date];
    NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
    
    NSLog(@"1: Visited %ld nodes in %f seconds", [visitedNodes count], interval);
}



NSMutableSet *recursiveSet = nil;
NSInteger recursiveNodeCount = 0;

void RecursivelyTraverse(Node *node)
{
    NSSet *newNodes = node.linkedNodes;
    for (Node *newNode in newNodes)
    {
        if (![recursiveSet containsObject:newNode])
        {
            [recursiveSet addObject:newNode];
            RecursivelyTraverse(newNode);
        }
    }
    
    recursiveNodeCount++;
}
