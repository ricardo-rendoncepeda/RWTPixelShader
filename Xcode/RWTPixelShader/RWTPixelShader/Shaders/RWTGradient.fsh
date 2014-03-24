//
//  RWTGradient.fsh
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
  vec2 position = gl_FragCoord.xy/uResolution;
  
  float brightness = (position.x+position.y)/2.;
  
  gl_FragColor = vec4(vec3(brightness), 1.);
}