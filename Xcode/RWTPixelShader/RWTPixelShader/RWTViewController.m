//
//  RWTViewController.m
//  RWTPixelShader
//
//  Created by Ricardo on 3/23/14.
//  Copyright (c) 2014 RayWenderlich. All rights reserved.
//

#import "RWTViewController.h"
#import "RWTBaseShader.h"

@interface RWTViewController ()

// Shader
@property (strong, nonatomic, readwrite) RWTBaseShader* shader;

@end

@implementation RWTViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Set up context
  EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
  [EAGLContext setCurrentContext:context];
  
  // Set up view
  GLKView *glkView = (GLKView *)self.view;
  glkView.context = context;
  
  // OpenGL ES settings
  glClearColor(1.f, 0.f, 0.f, 1.f);
  
  // Initialize shader
  self.shader = [[RWTBaseShader alloc] initWithVertexShader:@"RWTBase" fragmentShader:@"RWTSphere"];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
  glClear(GL_COLOR_BUFFER_BIT);
  
  [self.shader renderInRect:rect atTime:self.timeSinceFirstResume];
}

- (BOOL)prefersStatusBarHidden
{
  return YES;
}

@end
