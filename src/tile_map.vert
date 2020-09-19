#version 450

layout(location=0)in vec3 Vertex_Position;
layout(location=1)in vec3 Vertex_Normal;
layout(location=2)in vec2 Vertex_Uv;

layout(location=0)out vec2 v_Uv;

layout(set=0,binding=0)uniform Camera{
    mat4 ViewProj;
};

layout(set=2,binding=0)uniform Transform{
    mat4 Model;
};

layout(set=2,binding=1)uniform TileMapChunk{
    float layer_id;
    float scale;
};

void main(){
    v_Uv=Vertex_Uv;
    vec3 position=Vertex_Position*vec3(scale,scale,1.);
    position.z=layer_id;
    gl_Position=ViewProj*Model*vec4(position,1.);
}