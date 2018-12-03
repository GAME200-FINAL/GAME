// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|normal-6948-RGB,custl-7084-OUT,olwid-6361-OUT;n:type:ShaderForge.SFN_LightVector,id:3008,x:31650,y:32616,varname:node_3008,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:2310,x:31602,y:32872,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:402,x:32072,y:32757,varname:node_402,prsc:2,dt:1|A-3008-OUT,B-2310-OUT;n:type:ShaderForge.SFN_Append,id:1897,x:32250,y:32827,varname:node_1897,prsc:2|A-402-OUT,B-2732-OUT;n:type:ShaderForge.SFN_Slider,id:2732,x:31948,y:33002,ptovrint:False,ptlb:shadowvalue,ptin:_shadowvalue,varname:node_2732,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:7316,x:32402,y:32922,ptovrint:False,ptlb:linelierp,ptin:_linelierp,varname:node_7316,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-1897-OUT;n:type:ShaderForge.SFN_Tex2d,id:6730,x:32421,y:32504,ptovrint:False,ptlb:shadow,ptin:_shadow,varname:node_6730,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1897-OUT;n:type:ShaderForge.SFN_ScreenPos,id:1245,x:31693,y:33415,varname:node_1245,prsc:2,sctp:0;n:type:ShaderForge.SFN_Tex2d,id:8826,x:32011,y:33476,ptovrint:False,ptlb:line,ptin:_line,varname:node_8826,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b6c448b9a0c46ad41a71c765acc38b37,ntxv:0,isnm:False|UVIN-1245-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:57,x:32058,y:33185,ptovrint:False,ptlb:main,ptin:_main,varname:node_57,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6dbd9e8de5f89a5499bade10013d5067,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4273,x:32362,y:33516,varname:node_4273,prsc:2|A-57-RGB,B-8826-RGB;n:type:ShaderForge.SFN_Lerp,id:2176,x:32645,y:33076,varname:node_2176,prsc:2|A-57-RGB,B-4273-OUT,T-7316-R;n:type:ShaderForge.SFN_Multiply,id:7976,x:32682,y:32758,varname:node_7976,prsc:2|A-6730-RGB,B-2176-OUT;n:type:ShaderForge.SFN_Step,id:4944,x:32747,y:32540,varname:node_4944,prsc:2|A-37-OUT,B-402-OUT;n:type:ShaderForge.SFN_Lerp,id:7084,x:32933,y:32889,varname:node_7084,prsc:2|A-1309-OUT,B-7976-OUT,T-4944-OUT;n:type:ShaderForge.SFN_Add,id:1309,x:32668,y:33252,varname:node_1309,prsc:2|A-57-RGB,B-8692-OUT;n:type:ShaderForge.SFN_Slider,id:5098,x:32838,y:33384,ptovrint:False,ptlb:miaobian,ptin:_miaobian,varname:node_5098,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:3108,x:33104,y:33527,ptovrint:False,ptlb:zaobo,ptin:_zaobo,varname:node_3108,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6361,x:33232,y:33365,varname:node_6361,prsc:2|A-5098-OUT,B-3108-R;n:type:ShaderForge.SFN_Slider,id:37,x:32176,y:32356,ptovrint:False,ptlb:stepvalue,ptin:_stepvalue,varname:node_37,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1707526,max:1;n:type:ShaderForge.SFN_Tex2d,id:6948,x:32951,y:32435,ptovrint:False,ptlb:normal,ptin:_normal,varname:node_6948,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Slider,id:8692,x:32219,y:33359,ptovrint:False,ptlb:gaoguang,ptin:_gaoguang,varname:node_8692,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:5098-3108-2732-7316-6730-8826-57-37-6948-8692;pass:END;sub:END;*/

Shader "Shader Forge/cartoontest" {
    Properties {
        _miaobian ("miaobian", Range(0, 1)) = 0
        _zaobo ("zaobo", 2D) = "white" {}
        _shadowvalue ("shadowvalue", Range(0, 1)) = 0
        _linelierp ("linelierp", 2D) = "bump" {}
        _shadow ("shadow", 2D) = "white" {}
        _line ("line", 2D) = "white" {}
        _main ("main", 2D) = "white" {}
        _stepvalue ("stepvalue", Range(0, 1)) = 0.1707526
        _normal ("normal", 2D) = "bump" {}
        _gaoguang ("gaoguang", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _miaobian;
            uniform sampler2D _zaobo; uniform float4 _zaobo_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 _zaobo_var = tex2Dlod(_zaobo,float4(TRANSFORM_TEX(o.uv0, _zaobo),0.0,0));
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*(_miaobian*_zaobo_var.r),1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(float3(0,0,0),0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _shadowvalue;
            uniform sampler2D _linelierp; uniform float4 _linelierp_ST;
            uniform sampler2D _shadow; uniform float4 _shadow_ST;
            uniform sampler2D _line; uniform float4 _line_ST;
            uniform sampler2D _main; uniform float4 _main_ST;
            uniform float _stepvalue;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            uniform float _gaoguang;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 projPos : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 _normal_var = UnpackNormal(tex2D(_normal,TRANSFORM_TEX(i.uv0, _normal)));
                float3 normalLocal = _normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float4 _main_var = tex2D(_main,TRANSFORM_TEX(i.uv0, _main));
                float node_402 = max(0,dot(lightDirection,i.normalDir));
                float2 node_1897 = float2(node_402,_shadowvalue);
                float4 _shadow_var = tex2D(_shadow,TRANSFORM_TEX(node_1897, _shadow));
                float4 _line_var = tex2D(_line,TRANSFORM_TEX((sceneUVs * 2 - 1).rg, _line));
                float3 _linelierp_var = UnpackNormal(tex2D(_linelierp,TRANSFORM_TEX(node_1897, _linelierp)));
                float3 finalColor = lerp((_main_var.rgb+_gaoguang),(_shadow_var.rgb*lerp(_main_var.rgb,(_main_var.rgb*_line_var.rgb),_linelierp_var.r)),step(_stepvalue,node_402));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _shadowvalue;
            uniform sampler2D _linelierp; uniform float4 _linelierp_ST;
            uniform sampler2D _shadow; uniform float4 _shadow_ST;
            uniform sampler2D _line; uniform float4 _line_ST;
            uniform sampler2D _main; uniform float4 _main_ST;
            uniform float _stepvalue;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            uniform float _gaoguang;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 projPos : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 _normal_var = UnpackNormal(tex2D(_normal,TRANSFORM_TEX(i.uv0, _normal)));
                float3 normalLocal = _normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float4 _main_var = tex2D(_main,TRANSFORM_TEX(i.uv0, _main));
                float node_402 = max(0,dot(lightDirection,i.normalDir));
                float2 node_1897 = float2(node_402,_shadowvalue);
                float4 _shadow_var = tex2D(_shadow,TRANSFORM_TEX(node_1897, _shadow));
                float4 _line_var = tex2D(_line,TRANSFORM_TEX((sceneUVs * 2 - 1).rg, _line));
                float3 _linelierp_var = UnpackNormal(tex2D(_linelierp,TRANSFORM_TEX(node_1897, _linelierp)));
                float3 finalColor = lerp((_main_var.rgb+_gaoguang),(_shadow_var.rgb*lerp(_main_var.rgb,(_main_var.rgb*_line_var.rgb),_linelierp_var.r)),step(_stepvalue,node_402));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
