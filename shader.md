https://alain.xyz/blog/a-review-of-shader-languages



| Abbreviation | Language                    | Official Graphics APIs | Transpiling                                    |
| ------------ | --------------------------- | ---------------------- | ---------------------------------------------- |
| HLSL         | High Level Shading Language | DirectX                | Both `dxc` and `glslang` support HLSL → SPIR-V |
| GLSL         | OpenGL Shading Language     | Vulkan / OpenGL        | GLSL → SPIR-V → HLSL                           |
| MSL          | Metal Shading Language      | Metal                  | SPIR-V → MSL via SPIR-V Cross                  |
| WGSL         | WebGPU Shading Language     | WebGPU                 | `naga` or `tint` → SPIR-V                      |