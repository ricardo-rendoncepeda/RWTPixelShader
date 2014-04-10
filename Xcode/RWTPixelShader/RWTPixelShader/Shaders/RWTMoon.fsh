//
//  RWTMoon.fsh
//  RWTPixelShader
//
//  Created by Ricardo on 3/23/14.
//  Copyright (c) 2014 RayWenderlich. All rights reserved.
//

// Precision
precision highp float;

// Uniforms
uniform vec2 uResolution;
uniform float uTime;

// Constants
const vec3 cLight = normalize(vec3(.5, .5, 1.));

float randomNoise(vec2 p) {
  return fract(6791.*sin(47.*p.x+p.y*9973.));
}

float smoothNoise(vec2 p) {
  vec2 nn = vec2(p.x, p.y+1.);
  vec2 ee = vec2(p.x+1., p.y);
  vec2 ss = vec2(p.x, p.y-1.);
  vec2 ww = vec2(p.x-1., p.y);
  vec2 cc = vec2(p.x, p.y);
  
  float sum = 0.;
  sum += randomNoise(nn)/8.;
  sum += randomNoise(ee)/8.;
  sum += randomNoise(ss)/8.;
  sum += randomNoise(ww)/8.;
  sum += randomNoise(cc)/2.;
  
  return sum;
}

float interpolatedNoise(vec2 p) {
  vec2 s = smoothstep(0., 1., fract(p));
  
  float q11 = smoothNoise(vec2(floor(p.x), floor(p.y)));
  float q12 = smoothNoise(vec2(floor(p.x), ceil(p.y)));
  float q21 = smoothNoise(vec2(ceil(p.x), floor(p.y)));
  float q22 = smoothNoise(vec2(ceil(p.x), ceil(p.y)));
  
  float r1 = mix(q11, q21, s.x);
  float r2 = mix(q12, q22, s.x);
  
  return mix (r1, r2, s.y);
}

float diffuseSphere(vec2 p, float r) {
  float z = sqrt(r*r - p.x*p.x - p.y*p.y);
  vec3 normal = normalize(vec3(p.x, p.y, z));
  float diffuse = max(0., dot(normal, cLight));
  return diffuse;
}

void main(void) {
  vec2 center = vec2(uResolution.x/2., uResolution.y/2.);
  float radius = uResolution.x/2.;
  vec2 position = gl_FragCoord.xy - center;
  
  if (length(position) > radius) {
    discard;
  }
  
  // Diffuse
  float diffuse = diffuseSphere(position, radius);
  
  // Noise
  position /= radius;
  position += uTime;
  float noise = interpolatedNoise(position);
  
  gl_FragColor = vec4(vec3(diffuse*noise), 1.);
}
