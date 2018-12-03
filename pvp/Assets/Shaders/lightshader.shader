// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33797,y:32741,varname:node_9361,prsc:2|custl-6421-OUT;n:type:ShaderForge.SFN_Multiply,id:2378,x:32666,y:32722,varname:node_2378,prsc:2|A-1690-RGB,B-401-RGB,C-7795-A,D-1690-A,E-401-A;n:type:ShaderForge.SFN_Tex2d,id:401,x:32311,y:32985,ptovrint:False,ptlb:node_401,ptin:_node_401,varname:node_401,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-1565-UVOUT;n:type:ShaderForge.SFN_Step,id:5861,x:32817,y:32977,varname:node_5861,prsc:2|A-5034-OUT,B-401-R;n:type:ShaderForge.SFN_Vector1,id:5034,x:32600,y:32957,varname:node_5034,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Step,id:216,x:32817,y:33187,varname:node_216,prsc:2|A-625-OUT,B-401-R;n:type:ShaderForge.SFN_Vector1,id:625,x:32600,y:33113,varname:node_625,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Subtract,id:6111,x:33014,y:33132,varname:node_6111,prsc:2|A-216-OUT,B-5861-OUT;n:type:ShaderForge.SFN_Add,id:6421,x:33063,y:32644,varname:node_6421,prsc:2|A-2378-OUT,B-1535-OUT;n:type:ShaderForge.SFN_Color,id:1690,x:32289,y:32379,ptovrint:False,ptlb:node_1690,ptin:_node_1690,varname:node_1690,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Clamp01,id:9495,x:33203,y:33113,varname:node_9495,prsc:2|IN-6111-OUT;n:type:ShaderForge.SFN_Color,id:3757,x:33203,y:33321,ptovrint:False,ptlb:liang,ptin:_liang,varname:node_3757,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1535,x:33439,y:33244,varname:node_1535,prsc:2|A-9495-OUT,B-3757-RGB;n:type:ShaderForge.SFN_TexCoord,id:2830,x:31799,y:32958,varname:node_2830,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:1565,x:32038,y:32952,varname:node_1565,prsc:2,spu:0,spv:0|UVIN-2830-UVOUT;n:type:ShaderForge.SFN_VertexColor,id:7795,x:32260,y:32625,varname:node_7795,prsc:2;proporder:401-1690-3757;pass:END;sub:END;*/

Shader "Shader Forge/lightshader" {
    Properties {
        _node_401 ("node_401", 2D) = "white" {}
        [HDR]_node_1690 ("node_1690", Color) = (0.5,0.5,0.5,1)
        [HDR]_liang ("liang", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_401; uniform float4 _node_401_ST;
            uniform float4 _node_1690;
            uniform float4 _liang;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_2437 = _Time;
                float2 node_1565 = (i.uv0+node_2437.g*float2(0,0));
                float4 _node_401_var = tex2D(_node_401,TRANSFORM_TEX(node_1565, _node_401));
                float3 finalColor = ((_node_1690.rgb*_node_401_var.rgb*i.vertexColor.a*_node_1690.a*_node_401_var.a)+(saturate((step(0.4,_node_401_var.r)-step(0.5,_node_401_var.r)))*_liang.rgb));
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
            Cull Off
            
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
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
