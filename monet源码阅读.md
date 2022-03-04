

## 目录结构

- docs/images: readme 中引用的资源图片
- project: (应为 demo-projects ) Android/iOS 两个 demo应用
- scripts: 构建脚本
- source:  本项目源码
- third_party: 第三方源码
  -  glloader:  [KlayGE游戏引擎的一个子项目，是一个OpenGL扩展载入库。它可以载入OpenGL 1.0-4.2，OpenGL ES 1.0-2.0，同时也支持WGL、GLX、EGL和其他GL/GLES扩展](http://www.klayge.org/2011/12/18/glloader-4-0-0-released-with-android-support/)。 在移动端根本不需要这么多，glx 只支持 linux/mac 平台，glw 只支持 windows 平台。  实际运行时，需要动态检测设备是否支持扩展。[Android 官方文档: OpenGL](https://developer.android.com/guide/topics/graphics/opengl.html#kotlin) **glloader 似乎只为native_test 所用**
  - lodepng: [png encoder&decode without dependencies](https://github.com/lvandeve/lodepng)  **lodepng 只为 blue_colorblindness_correction_operation 用，仅为 decode，也许不需要！**
  - swiftshader: [google swiftshader](https://github.com/google/swiftshader) is a high-performance CPU-based implementation of the Vulkan graphics API12. Its goal is to provide hardware independence for advanced 3D graphics。 **应该没有用到，删除掉也能正常编译！**
  - utils: 一个 python 脚本，似乎是为优化 iOS metal 高斯模糊 shader 



- **readme 所说的 AI 在哪体现？没找到 tensorflow 也没找到 opencv**
- third_party 里的代码，可以认为都是不需要的，只有 lodepng 在一个算子里使用到。



## Source



### framework

gpu: 执行 metal/opengl shader 的环境，传递各种参数
graph:   有多个效果叠加时，需构造一个图结构决定渲染顺序
operator: 所谓"算子"。每个“算子”是一段 shader 程序及对应的输入参数并提供输出接口
platform: 此目录只有 iOS 应放到父级同级 plaform 下
protocol: 协议，包含“算子”，“参数”等数据
register: 似乎是一个注册方法的助手函数，原理是使用 #define ，并传递实际要执行的函数指针。
utils: 矩阵转换 util



### platform

android: Android sdk,包括 JNI 接口 和  Java api
iOS: 空项目，应为 framework/platform/iOS 

