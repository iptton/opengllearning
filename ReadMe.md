
# OpenGL Learing

这是一个记录学习 OpenGL 的个人项目。

## Hello world

第一次接触 Shader 语言，最难理解的是他的输入和输出。因为我们日常的语言是这样的：

```C
ResultType funcitonName(InputType input[, InputType2 input2]);
```

格式也许会有些不同，但基本上在一个函数声明里会把这几个要素写明：输入值类型，函数名，返回值类型。但 shader 的 main 函数是一个无返回值，无参数的函数。**它的输入输出在哪？**

---

## shader 的输入和输出

这个教程更好：[WebGL Fundamentals](https://webglfundamentals.org/webgl/lessons/zh_cn/webgl-fundamentals.html)

**shader 翻译成着色器实在让人难以理解，顶点 shader 并没有着色的过程，只提供坐标**。

理解以下概念：

- `光栅化`：顶点转换为片元的过程 *顶点（vertexs） 图元（primitives） 片元（fragments，又叫片断） 像素（pixels）*

### 着色器(shader)的输入

着色器获取数据有四种方式

- 属性 (Attributes) 和缓冲
- 全局变量 (Uniforms)
- 纹理 (Textures)
- 可变量 (Varyings)

#### 属性 Attributes

缓冲是发送到 GPU 的一些二进制数据序列，通常包括位置，法向量，纹理坐标，顶点颜色值等。

属性用于指明如何从缓冲中获取所需要的数据并将它提供给顶点着色器。例如你可能在缓冲中用三个 32 位浮点型 数据存储一个位置值。一个确切的属性由以下部分组成：

- 从哪个缓冲获取数据
- 获取什么类型的数据
- 起始偏移值是多少
- 到达下一位置的字节数是多少

顶点着色器运行的次数是一个指定的确切数字，每次执行都会从指定缓冲获取下一个值。

#### 全局变量 Uniforms

程序运行前赋值，运行过程全局有效。

#### 纹理 Textures

纹理是一个数据序列，运行时，可随意读取其中的数据。大多数情况下放的是图像数据。但也可随意存放任何数据。

#### 可变量 Varyings

顶点着色器通过可变量向片断着色器传值。

### WebGL Hello World

GL 只关心两件事，空间中的坐标值和颜色值。这通过 vertex shader 和 fragment shader 来完成。

在 OpenGL 的世界里，画面的坐标范围永远都在 [-1,1] 之间。这就是*标准化设备坐标(Normalized Device Coordinates, NDC)*。

#### 纯色

vertex shader

```glsl
// 属性
attribute vec4 a_position;
void main() {
  // gl_Position 为 GL 内部设置的**可变量**，即，向其写值会被 fragment shader 使用
  gl_Position = a_position;
}
```

fragment shader

```glsl
// 设置 float 为中等精度 ?
precision medium float;

void main() {
  // gl_FragColor 为 GL 内部设置的变量，用于给指定位置“着色”
  gl_FragColor = vec4(1,0,0.5,1); // rgba值
}
```

要运行以上代码，还需要搭建 WebGL 环境，这涉及一些 HTML/CSS/JavaScript 知识，但这和当前学习内容没什么关系。我找到了一个工具能快速运行 shader ： vscode + glsl-canvas。

只需要把以上代码合并，并保存成一个 glsl 文件始可实时预览

```glsl
#if defined(VERTEX)
attribute vec4 a_position;
void main() {
    gl_Position = a_position*2.0;
}
#else
precision mediump float;

void main() {  
    gl_FragColor = vec4(0.451, 0.5725, 0.498, 1.0);
}
#endif
```

以上代码会得到一个纯色画布。

#### 画个三角形
