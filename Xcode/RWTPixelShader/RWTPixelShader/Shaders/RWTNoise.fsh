//
//  RWTNoise.fsh
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
  vec2 inter = smoothstep(0., 1., fract(p));
  
  float q11 = smoothNoise(vec2(floor(p.x), floor(p.y)));
  float q12 = smoothNoise(vec2(floor(p.x), ceil(p.y)));
  float q21 = smoothNoise(vec2(ceil(p.x), floor(p.y)));
  float q22 = smoothNoise(vec2(ceil(p.x), ceil(p.y)));
  
  float r1 = mix(q11, q21, inter.x);
  float r2 = mix(q12, q22, inter.x);
  
  return mix (r1, r2, inter.y);
}

void main(void) {
  vec2 position = gl_FragCoord.xy/uResolution.xx;
  
  if ((position.x>1.) || (position.y>1.)) {
    discard;
  }
  
  float tiles = 4.;
  position *= tiles;
  position += uTime;
  float n = interpolatedNoise(position);
  
  gl_FragColor = vec4(vec3(n), 1.);
}
