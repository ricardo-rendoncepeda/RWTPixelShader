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

void main(void) {
  vec2 position = gl_FragCoord.xy/uResolution - vec2(.5, .5);
  position = vec2(uProjectionMatrix * vec4(position, 0.0, 1.0));
  
  if (length(position) > .5) {
    discard;
  }
  
  float r = .5;
  float x = position.x;
  float y = position.y;
  float z = sqrt(r*r - x*x - y*y);
  
  vec3 normal = normalize(vec3(x, y, z));
  vec3 light = normalize(vec3(.5, .5, 1.));
  float diffuse = max(dot(normal, light), 0.);
  
  gl_FragColor = vec4(vec3(diffuse), 1.);
}