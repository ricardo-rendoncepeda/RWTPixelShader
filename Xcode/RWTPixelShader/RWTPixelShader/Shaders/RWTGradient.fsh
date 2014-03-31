//
//  RWTGradient.fsh
//  RWTPixelShader
//
//  Created by Ricardo on 3/23/14.
//  Copyright (c) 2014 RayWenderlich. All rights reserved.
//

// Precision
precision highp float;

// Uniforms
uniform vec2 uResolution;

void main(void) {
  vec2 position = gl_FragCoord.xy/uResolution;
  float gradient = (position.x+position.y)/2.;
  gl_FragColor = vec4(0., gradient, 0., 1.);
}