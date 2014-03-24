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
uniform mat4 uProjectionMatrix;
uniform vec2 uResolution;
uniform float uTime;

// Constants
const vec2 cCenter = vec2(.5, .5);
const float cRadius = .5;
const vec3 cLight = normalize(vec3(.5, .5, 1.));

void main(void) {
  vec2 position = gl_FragCoord.xy/uResolution - cCenter;
  position = vec2(uProjectionMatrix * vec4(position, 0.0, 1.0));
  
  if (length(position) > cRadius) {
    discard;
  }
  
  float x = position.x;
  float y = position.y;
  float z = sqrt(cRadius*cRadius - x*x - y*y);
  
  vec3 normal = normalize(vec3(x, y, z));
  float diffuse = max(dot(normal, cLight), 0.);
  
  gl_FragColor = vec4(vec3(diffuse), 1.);
}