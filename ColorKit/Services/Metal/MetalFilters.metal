//
//  MetalFilters.metal
//  ColorKit
//
//  Created by Руслан Ахмадеев on 12.03.2021.
//

#include <metal_stdlib>
using namespace metal;

kernel void adjustSaturation(texture2d<float, access::sample> inTexture[[texture(0)]],
                             texture2d<float, access::write> outTexture[[texture(1)]],
                             constant float &saturation [[buffer(0)]],
                             uint2 gid [[thread_position_in_grid]]
                             ) {
    float4 inColor = inTexture.read(gid);
    float value = dot(inColor.rgb, float3(0.299, 0.587, 0.114));
    float4 outColor(mix(float4(float3(value), 1.0), inColor, saturation));

    outTexture.write(outColor, gid);
}
                             
                             
    

