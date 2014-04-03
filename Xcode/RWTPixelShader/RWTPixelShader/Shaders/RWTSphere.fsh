//
//  RWTSphere.fsh
//  RWTPixelShader
//
//  Created by Ricardo on 3/23/14.
//  Copyright (c) 2014 RayWenderlich. All rights reserved.
//

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
  
  float z = sqrt(radius*radius - position.x*position.x - position.y*position.y);
  vec3 normal = normalize(vec3(position.x, position.y, z));
  float diffuse = max(0., dot(normal, cLight));
  
  gl_FragColor = vec4(vec3(diffuse), 1.);
}