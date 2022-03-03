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
