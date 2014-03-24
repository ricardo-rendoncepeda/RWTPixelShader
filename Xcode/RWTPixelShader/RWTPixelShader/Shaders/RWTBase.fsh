//
//  RWTBase.fsh
//  RWTPixelShader
//
//  Created by Ricardo on 3/23/14.
//  Copyright (c) 2014 RayWenderlich. All rights reserved.
//

// FRAGMENT SHADER

// Precision
precision highp float;

// Uniforms
uniform vec2 uResolution;
uniform float uTime;

void main(void)
{
  gl_FragColor = vec4(0.0, 1.0, 0.0, 1.0);
}
