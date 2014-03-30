//
//  RWTSphere.fsh
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

// Constants
const vec3 cLight = normalize(vec3(.5, .5, 1.));

void main(void) {
  vec2 center = vec2(uResolution.x/2., uResolution.y/2.);
  float radius = uResolution.x/2.;
  vec2 position = gl_FragCoord.xy - center;
  
  if (length(position) > radius) {
    discard;
  }
  
  float x = position.x;
  float y = position.y;
  float z = sqrt(radius*radius - x*x - y*y);
  
  vec3 normal = normalize(vec3(x, y, z));
  float diffuse = max(dot(normal, cLight), 0.);
  
  gl_FragColor = vec4(vec3(diffuse), 1.);
}