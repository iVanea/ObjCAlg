//
//  Node.h
//  RemoveCharDuplicates
//
//  Created by Timotin Ion on 1/20/19.
//  Copyright © 2019 Timotin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject  {
    NSSet *linkedNodes;
}
@property(nonatomic, retain) NSSet *linkedNodes;
@end

NS_ASSUME_NONNULL_END
