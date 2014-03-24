//
//  RWTBase.vsh
//  RWTPixelShader
//
//  Created by Ricardo on 3/23/14.
//  Copyright (c) 2014 RayWenderlich. All rights reserved.
//

// VERTEX SHADER

// Attributes
attribute vec2 aPosition;

void main(void)
{
  gl_Position = vec4(aPosition, 0., 1.);
}