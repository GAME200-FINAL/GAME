// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-7643-OUT,clip-2661-OUT;n:type:ShaderForge.SFN_Tex2d,id:343,x:32091,y:32423,ptovrint:False,ptlb:M1,ptin:_M1,varname:node_343,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-9274-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8578,x:32065,y:32866,ptovrint:False,ptlb:M2,ptin:_M2,varname:node_8578,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-7652-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2515,x:31497,y:32361,varname:node_2515,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:9274,x:31767,y:32355,varname:node_9274,prsc:2,spu:0.2,spv:0.2|UVIN-2515-UVOUT;n:type:ShaderForge.SFN_Panner,id:7652,x:31778,y:32828,varname:node_7652,prsc:2,spu:-0.2,spv:0.05|UVIN-9483-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9483,x:31421,y:32858,varname:node_9483,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:4452,x:31987,y:32696,ptovrint:False,ptlb:clip,ptin:_clip,varname:node_4452,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:0.2646005,max:2;n:type:ShaderForge.SFN_Add,id:9012,x:32328,y:32463,varname:node_9012,prsc:2|A-4452-OUT,B-343-R;n:type:ShaderForge.SFN_Add,id:173,x:32362,y:32772,varname:node_173,prsc:2|A-4452-OUT,B-8578-R;n:type:ShaderForge.SFN_Multiply,id:2661,x:32560,y:32606,varname:node_2661,prsc:2|A-9012-OUT,B-173-OUT;n:type:ShaderForge.SFN_Color,id:4387,x:32738,y:32488,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_4387,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:4859,x:32610,y:33022,ptovrint:False,ptlb:strength,ptin:_strength,varname:node_4859,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5910164,max:1;n:type:ShaderForge.SFN_Multiply,id:7643,x:32961,y:32622,varname:node_7643,prsc:2|A-4387-RGB,B-4859-OUT;proporder:343-8578-4452-4387-4859;pass:END;sub:END;*/

Shader "Shader Forge/electricity1" {
    Properties {
        _M1 ("M1", 2D) = "white" {}
        _M2 ("M2", 2D) = "white" {}
        _clip ("clip", Range(-2, 2)) = 0.2646005
        [HDR]_Color ("Color", Color) = (0.5,0.5,0.5,1)
        _strength ("strength", Range(0, 1)) = 0.5910164
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _M1; uniform float4 _M1_ST;
            uniform sampler2D _M2; uniform float4 _M2_ST;
            uniform float _clip;
            uniform float4 _Color;
            uniform float _strength;
            struct VertexInput {
                float4 vertex : POSITION;
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
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 node_4787 = _Time;
                float2 node_9274 = (i.uv0+node_4787.g*float2(0.2,0.2));
                float4 _M1_var = tex2D(_M1,TRANSFORM_TEX(node_9274, _M1));
                float2 node_7652 = (i.uv0+node_4787.g*float2(-0.2,0.05));
                float4 _M2_var = tex2D(_M2,TRANSFORM_TEX(node_7652, _M2));
                float node_2661 = ((_clip+_M1_var.r)*(_clip+_M2_var.r));
                clip(node_2661 - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = (_Color.rgb*_strength);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _M1; uniform float4 _M1_ST;
            uniform sampler2D _M2; uniform float4 _M2_ST;
            uniform float _clip;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 node_2206 = _Time;
                float2 node_9274 = (i.uv0+node_2206.g*float2(0.2,0.2));
                float4 _M1_var = tex2D(_M1,TRANSFORM_TEX(node_9274, _M1));
                float2 node_7652 = (i.uv0+node_2206.g*float2(-0.2,0.05));
                float4 _M2_var = tex2D(_M2,TRANSFORM_TEX(node_7652, _M2));
                float node_2661 = ((_clip+_M1_var.r)*(_clip+_M2_var.r));
                clip(node_2661 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
