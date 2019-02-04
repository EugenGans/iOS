//
//  GameScene.m
//  Fish1
//
//  Created by Admin on 13.09.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    [self setUpScene];
    [self fillAquarium];
    
}

-(SKLabelNode*) createLabelWithTitle: (NSString*)theTitle{
    SKLabelNode *hireLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    hireLabel.text = theTitle;
    hireLabel.fontSize = 55;
    hireLabel.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    return hireLabel;
}

-(void) setUpScene {
    self.backgroundColor = [SKColor blueColor];
    //self.physicsWorld.gravity = CGVectorMake(0.0, 1.0);
    
    [self addChild: [self createLabelWithTitle: @"Hire Me"]];
    
    SKSpriteNode *sceneNode = [SKSpriteNode spriteNodeWithImageNamed:@"maxresdefault"];
    sceneNode.position = CGPointMake(0, 0);
    //sceneNode.size = CGSizeMake(640, 320);
    sceneNode.anchorPoint = CGPointMake(0, 0);
    sceneNode.name = @"sceneNode";
    sceneNode.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    sceneNode.physicsBody.restitution = 0;
    [self addChild:sceneNode];
}

-(void)fillAquarium {
    /* Called when a touch begins */
    
    //for (UITouch *touch in touches) {
    //CGPoint location = [touch locationInNode:self];
    for (int y = 4; y <= 9; y ++){
        [self createFishOnY:y ];
    }
}

-(void) createFishOnY: (int)level {
    int speed = 1,
        xVector = 1 - 2 * (level %2),
        maxX = CGRectGetMaxX(self.frame),
        theX = maxX * (0.5 + xVector * 0.3),
        theY = level * 50;
    
    CGPoint location = CGPointMake(theX,theY);
    
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Fish"];
    
    sprite.xScale = 0.5;
    sprite.yScale = 0.5;
    sprite.position = location;
    sprite.name = @"fish";
    sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:(sprite.frame.size.width * 0.4)];
    sprite.physicsBody.dynamic = YES;
    sprite.physicsBody.affectedByGravity = NO;
    sprite.physicsBody.restitution  = 0;
    sprite.physicsBody.linearDamping = 0;
    sprite.physicsBody.friction = 0;
    
    //sprite.physicsBody.velocity = CGVectorMake(level * xVector * -10 * speed, level * speed);
    
    [self addChild:sprite];
    
    [sprite.physicsBody applyImpulse:CGVectorMake(level * xVector * -10 * speed, level * speed) ];
    //[sprite.physicsBody applyForce:CGVectorMake(50, 50)];
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    /*[self enumerateChildNodesWithName:@"fish" usingBlock:^(SKNode* node, BOOL* stop){
     node.position = CGPointMake(node.position.x + 0.5, node.position.y + 0.1);
     }];*/
    
}

@end
