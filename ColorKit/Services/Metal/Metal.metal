//
//  Metal.metal
//  ColorKit
//
//  Created by Руслан Ахмадеев on 10.03.2021.
//

#include <metal_stdlib>
using namespace metal;

kernel void custom_function(texture2d<float, access::read> inputTexture [[texture(0)]],
                             texture2d<float, access::write> outputTexture [[texture(1)]],
                             uint2 gid [[thread_position_in_grid]]
                             )
{
    const float4 colorAtPixel = inputTexture.read(gid);
    const float4 outputColor = float4(colorAtPixel.b, colorAtPixel.r, colorAtPixel.g, 1);
    outputTexture.write(outputColor, gid);
}


