//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by Thunis Kruger on 2015/01/06.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay{
    CCPhysicsNode *_physicsNode;
    CCNode *_catapultArm;
    
    
}


- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    [self launchPenguin];
    
}

-(void)launchPenguin{
    CCNode* penguin = [CCBReader load:@"Penguin"];
    // position the penguin at the bowl of the catapult
    penguin.position = ccpAdd(_catapultArm.position, ccp(16, 50));
    [_physicsNode addChild:penguin];
    
    // manually create & apply a force to launch the penguin
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applyForce:force];
}

@end
