Shader "Hidden/FrameDebuggerRenderTargetDisplay" {
Properties {
 _MainTex ("", any) = "white" { }
}
SubShader { 
 Tags { "ForceSupported"="true" }
 Pass {
  Tags { "ForceSupported"="true" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 38886
Program "vp" {
SubProgram "opengl " {
"!!GLSL
					#version 120
					
					#ifdef VERTEX
					
					varying vec3 xlv_TEXCOORD0;
					void main ()
					{
					  vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = gl_Vertex.xyz;
					  gl_Position = (gl_ModelViewProjectionMatrix * tmpvar_1);
					  xlv_TEXCOORD0 = gl_MultiTexCoord0.xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform vec4 _Channels;
					uniform vec4 _Levels;
					uniform sampler2D _MainTex;
					varying vec3 xlv_TEXCOORD0;
					void main ()
					{
					  vec4 col_1;
					  col_1 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) - _Levels.xxxx);
					  col_1 = (col_1 / (_Levels.yyyy - _Levels.xxxx));
					  col_1 = (col_1 * _Channels);
					  float tmpvar_2;
					  tmpvar_2 = dot (_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					  if ((tmpvar_2 == 1.0)) {
					    col_1 = vec4(dot (col_1, vec4(1.0, 1.0, 1.0, 1.0)));
					  };
					  gl_FragData[0] = col_1;
					}
					
					
					#endif"
}
SubProgram "d3d9 " {
"vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   row_major float4x4 glstate_matrix_mvp;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   glstate_matrix_mvp c0       4
					//
					
					    vs_3_0
					    def c4, 1, 0, 0, 0
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_position o0
					    dcl_texcoord o1.xyz
					    mad r0, v0.xyzx, c4.xxxy, c4.yyyx
					    dp4 o0.x, c0, r0
					    dp4 o0.y, c1, r0
					    dp4 o0.z, c2, r0
					    dp4 o0.w, c3, r0
					    mov o1.xyz, v1
					
					// approximately 6 instruction slots used"
}
SubProgram "d3d11 " {
"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_TEXCOORD0;
					out vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}"
}
SubProgram "gles " {
"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (glstate_matrix_mvp * tmpvar_1);
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 _Channels;
					uniform mediump vec4 _Levels;
					uniform sampler2D _MainTex;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  tex_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  mediump vec4 col_4;
					  col_4 = (tex_1 - _Levels.xxxx);
					  col_4 = (col_4 / (_Levels.yyyy - _Levels.xxxx));
					  col_4 = (col_4 * _Channels);
					  lowp float tmpvar_5;
					  tmpvar_5 = dot (_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					  if ((tmpvar_5 == 1.0)) {
					    col_4 = vec4(dot (col_4, vec4(1.0, 1.0, 1.0, 1.0)));
					  };
					  tmpvar_3 = col_4;
					  gl_FragData[0] = tmpvar_3;
					}
					
					
					#endif"
}
SubProgram "d3d11_9x " {
"vs_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_TEXCOORD0;
					out vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}"
}
SubProgram "gles3 " {
"!!GLES3
					#ifdef VERTEX
					#version 300 es
					uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_TEXCOORD0;
					out highp vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}
					#endif
					#ifdef FRAGMENT
					#version 300 es
					precision highp int;
					uniform 	lowp vec4 _Channels;
					uniform 	mediump vec4 _Levels;
					uniform lowp sampler2D _MainTex;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp float u_xlat10_2;
					bool u_xlatb3;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_0 + (-_Levels.xxxx);
					    u_xlat16_1 = (-_Levels.x) + _Levels.y;
					    u_xlat16_0 = u_xlat16_0 / vec4(u_xlat16_1);
					    u_xlat16_0 = u_xlat16_0 * _Channels;
					    u_xlat16_1 = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat10_2 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat10_2==1.0);
					#else
					    u_xlatb3 = u_xlat10_2==1.0;
					#endif
					    u_xlat16_0 = (bool(u_xlatb3)) ? vec4(u_xlat16_1) : u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					#endif"
}
SubProgram "glcore " {
"!!GL3x
					#ifdef VERTEX
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shader_bit_encoding : enable
					uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
					in  vec4 in_POSITION0;
					in  vec3 in_TEXCOORD0;
					out vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shader_bit_encoding : enable
					uniform 	vec4 _Channels;
					uniform 	vec4 _Levels;
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					float u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0 + (-_Levels.xxxx);
					    u_xlat1 = (-_Levels.x) + _Levels.y;
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * _Channels;
					    u_xlat1 = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat3 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb3 = u_xlat3==1.0;
					    SV_Target0 = (bool(u_xlatb3)) ? vec4(u_xlat1) : u_xlat0;
					    return;
					}
					#endif"
}
}
Program "fp" {
SubProgram "opengl " {
"!!GLSL"
}
SubProgram "d3d9 " {
"ps_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   float4 _Channels;
					//   float4 _Levels;
					//   sampler2D _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Channels    c0       1
					//   _Levels      c1       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c2, 1, -1, 0, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    texld_pp r0, v0, s0
					    add_pp r0, r0, -c1.x
					    add_pp r1.x, -c1.x, c1.y
					    rcp r1.x, r1.x
					    mul_pp r0, r0, r1.x
					    mul_pp r0, r0, c0
					    dp4_pp r1.x, r0, c2.x
					    mov r2.x, c2.x
					    dp4_pp r1.y, c0, r2.x
					    add r1.y, r1.y, c2.y
					    cmp_pp oC0, -r1_abs.y, r1.x, r0
					
					// approximately 11 instruction slots used (1 texture, 10 arithmetic)"
}
SubProgram "d3d11 " {
"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _Channels;
						vec4 _Levels;
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 + (-_Levels.xxxx);
					    u_xlat1 = (-_Levels.x) + _Levels.y;
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * _Channels;
					    u_xlat1 = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat3 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb3 = u_xlat3==1.0;
					    SV_Target0 = (bool(u_xlatb3)) ? vec4(u_xlat1) : u_xlat0;
					    return;
					}"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "d3d11_9x " {
"ps_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _Channels;
						vec4 _Levels;
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 + (-_Levels.xxxx);
					    u_xlat1 = (-_Levels.x) + _Levels.y;
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * _Channels;
					    u_xlat1 = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat3 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb3 = u_xlat3==1.0;
					    SV_Target0 = (bool(u_xlatb3)) ? vec4(u_xlat1) : u_xlat0;
					    return;
					}"
}
SubProgram "gles3 " {
"!!GLES3"
}
SubProgram "glcore " {
"!!GL3x"
}
}
 }
 Pass {
  Tags { "ForceSupported"="true" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 95580
Program "vp" {
SubProgram "opengl " {
"!!GLSL
					#version 120
					
					#ifdef VERTEX
					
					varying vec3 xlv_TEXCOORD0;
					void main ()
					{
					  vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = gl_Vertex.xyz;
					  gl_Position = (gl_ModelViewProjectionMatrix * tmpvar_1);
					  xlv_TEXCOORD0 = gl_MultiTexCoord0.xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform vec4 _Channels;
					uniform vec4 _Levels;
					uniform samplerCube _MainTex;
					varying vec3 xlv_TEXCOORD0;
					void main ()
					{
					  vec4 col_1;
					  col_1 = (textureCube (_MainTex, xlv_TEXCOORD0) - _Levels.xxxx);
					  col_1 = (col_1 / (_Levels.yyyy - _Levels.xxxx));
					  col_1 = (col_1 * _Channels);
					  float tmpvar_2;
					  tmpvar_2 = dot (_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					  if ((tmpvar_2 == 1.0)) {
					    col_1 = vec4(dot (col_1, vec4(1.0, 1.0, 1.0, 1.0)));
					  };
					  gl_FragData[0] = col_1;
					}
					
					
					#endif"
}
SubProgram "d3d9 " {
"vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   row_major float4x4 glstate_matrix_mvp;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   glstate_matrix_mvp c0       4
					//
					
					    vs_3_0
					    def c4, 1, 0, 0, 0
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_position o0
					    dcl_texcoord o1.xyz
					    mad r0, v0.xyzx, c4.xxxy, c4.yyyx
					    dp4 o0.x, c0, r0
					    dp4 o0.y, c1, r0
					    dp4 o0.z, c2, r0
					    dp4 o0.w, c3, r0
					    mov o1.xyz, v1
					
					// approximately 6 instruction slots used"
}
SubProgram "d3d11 " {
"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_TEXCOORD0;
					out vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}"
}
SubProgram "gles " {
"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (glstate_matrix_mvp * tmpvar_1);
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 _Channels;
					uniform mediump vec4 _Levels;
					uniform lowp samplerCube _MainTex;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tex_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = textureCube (_MainTex, xlv_TEXCOORD0);
					  tex_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  mediump vec4 col_4;
					  col_4 = (tex_1 - _Levels.xxxx);
					  col_4 = (col_4 / (_Levels.yyyy - _Levels.xxxx));
					  col_4 = (col_4 * _Channels);
					  lowp float tmpvar_5;
					  tmpvar_5 = dot (_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					  if ((tmpvar_5 == 1.0)) {
					    col_4 = vec4(dot (col_4, vec4(1.0, 1.0, 1.0, 1.0)));
					  };
					  tmpvar_3 = col_4;
					  gl_FragData[0] = tmpvar_3;
					}
					
					
					#endif"
}
SubProgram "d3d11_9x " {
"vs_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_TEXCOORD0;
					out vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}"
}
SubProgram "gles3 " {
"!!GLES3
					#ifdef VERTEX
					#version 300 es
					uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_TEXCOORD0;
					out highp vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}
					#endif
					#ifdef FRAGMENT
					#version 300 es
					precision highp int;
					uniform 	lowp vec4 _Channels;
					uniform 	mediump vec4 _Levels;
					uniform lowp samplerCube _MainTex;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					lowp float u_xlat10_2;
					bool u_xlatb3;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
					    u_xlat16_0 = u_xlat10_0 + (-_Levels.xxxx);
					    u_xlat16_1 = (-_Levels.x) + _Levels.y;
					    u_xlat16_0 = u_xlat16_0 / vec4(u_xlat16_1);
					    u_xlat16_0 = u_xlat16_0 * _Channels;
					    u_xlat16_1 = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat10_2 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat10_2==1.0);
					#else
					    u_xlatb3 = u_xlat10_2==1.0;
					#endif
					    u_xlat16_0 = (bool(u_xlatb3)) ? vec4(u_xlat16_1) : u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					#endif"
}
SubProgram "glcore " {
"!!GL3x
					#ifdef VERTEX
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shader_bit_encoding : enable
					uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
					in  vec4 in_POSITION0;
					in  vec3 in_TEXCOORD0;
					out vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    return;
					}
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shader_bit_encoding : enable
					uniform 	vec4 _Channels;
					uniform 	vec4 _Levels;
					uniform  samplerCube _MainTex;
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					float u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
					    u_xlat0 = u_xlat10_0 + (-_Levels.xxxx);
					    u_xlat1 = (-_Levels.x) + _Levels.y;
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * _Channels;
					    u_xlat1 = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat3 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb3 = u_xlat3==1.0;
					    SV_Target0 = (bool(u_xlatb3)) ? vec4(u_xlat1) : u_xlat0;
					    return;
					}
					#endif"
}
}
Program "fp" {
SubProgram "opengl " {
"!!GLSL"
}
SubProgram "d3d9 " {
"ps_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   float4 _Channels;
					//   float4 _Levels;
					//   samplerCUBE _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Channels    c0       1
					//   _Levels      c1       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c2, 1, -1, 0, 0
					    dcl_texcoord v0.xyz
					    dcl_cube s0
					    texld_pp r0, v0, s0
					    add_pp r0, r0, -c1.x
					    add_pp r1.x, -c1.x, c1.y
					    rcp r1.x, r1.x
					    mul_pp r0, r0, r1.x
					    mul_pp r0, r0, c0
					    dp4_pp r1.x, r0, c2.x
					    mov r2.x, c2.x
					    dp4_pp r1.y, c0, r2.x
					    add r1.y, r1.y, c2.y
					    cmp_pp oC0, -r1_abs.y, r1.x, r0
					
					// approximately 11 instruction slots used (1 texture, 10 arithmetic)"
}
SubProgram "d3d11 " {
"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _Channels;
						vec4 _Levels;
					};
					uniform  samplerCube _MainTex;
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
					    u_xlat0 = u_xlat0 + (-_Levels.xxxx);
					    u_xlat1 = (-_Levels.x) + _Levels.y;
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * _Channels;
					    u_xlat1 = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat3 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb3 = u_xlat3==1.0;
					    SV_Target0 = (bool(u_xlatb3)) ? vec4(u_xlat1) : u_xlat0;
					    return;
					}"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "d3d11_9x " {
"ps_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[6];
						vec4 _Channels;
						vec4 _Levels;
					};
					uniform  samplerCube _MainTex;
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					float u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
					    u_xlat0 = u_xlat0 + (-_Levels.xxxx);
					    u_xlat1 = (-_Levels.x) + _Levels.y;
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * _Channels;
					    u_xlat1 = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat3 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb3 = u_xlat3==1.0;
					    SV_Target0 = (bool(u_xlatb3)) ? vec4(u_xlat1) : u_xlat0;
					    return;
					}"
}
SubProgram "gles3 " {
"!!GLES3"
}
SubProgram "glcore " {
"!!GL3x"
}
}
 }
}
Fallback Off
}