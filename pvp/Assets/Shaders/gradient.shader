// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33329,y:32733,varname:node_9361,prsc:2|custl-9101-OUT;n:type:ShaderForge.SFN_TexCoord,id:443,x:31382,y:33056,varname:node_443,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Lerp,id:9101,x:32449,y:32652,varname:node_9101,prsc:2|A-8090-RGB,B-5305-RGB,T-2341-OUT;n:type:ShaderForge.SFN_ArcTan2,id:5605,x:32140,y:33014,varname:node_5605,prsc:2,attp:2|A-8312-R,B-8312-G;n:type:ShaderForge.SFN_RemapRange,id:2176,x:31722,y:33124,varname:node_2176,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-443-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:8312,x:31894,y:32948,varname:node_8312,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2176-OUT;n:type:ShaderForge.SFN_Length,id:6521,x:31914,y:33219,varname:node_6521,prsc:2|IN-2176-OUT;n:type:ShaderForge.SFN_Floor,id:6601,x:32335,y:33400,varname:node_6601,prsc:2|IN-6521-OUT;n:type:ShaderForge.SFN_OneMinus,id:37,x:32535,y:33422,varname:node_37,prsc:2|IN-6601-OUT;n:type:ShaderForge.SFN_Add,id:6060,x:32310,y:33253,varname:node_6060,prsc:2|A-7585-OUT,B-6521-OUT;n:type:ShaderForge.SFN_Vector1,id:7585,x:32140,y:33160,varname:node_7585,prsc:2,v1:0.15;n:type:ShaderForge.SFN_Floor,id:5976,x:32521,y:33159,varname:node_5976,prsc:2|IN-6060-OUT;n:type:ShaderForge.SFN_Slider,id:2341,x:31894,y:32850,ptovrint:False,ptlb:value,ptin:_value,varname:node_2341,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:145,x:32957,y:33177,varname:node_145,prsc:2|A-9516-OUT,B-4142-OUT;n:type:ShaderForge.SFN_Add,id:9516,x:32659,y:33052,varname:node_9516,prsc:2|A-2775-OUT,B-4078-OUT;n:type:ShaderForge.SFN_RemapRange,id:2775,x:32324,y:32867,varname:node_2775,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.3|IN-2341-OUT;n:type:ShaderForge.SFN_OneMinus,id:4078,x:32347,y:33077,varname:node_4078,prsc:2|IN-5605-OUT;n:type:ShaderForge.SFN_Color,id:8090,x:31947,y:32438,ptovrint:False,ptlb:node_8090,ptin:_node_8090,varname:node_8090,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5305,x:31935,y:32644,ptovrint:False,ptlb:node_5305,ptin:_node_5305,varname:node_5305,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:4142,x:32717,y:32945,varname:node_4142,prsc:2,v1:1;proporder:2341-8090-5305;pass:END;sub:END;*/

Shader "Shader Forge/gradient" {
    Properties {
        _value ("value", Range(0, 1)) = 1
        [HDR]_node_8090 ("node_8090", Color) = (0.5,0.5,0.5,1)
        [HDR]_node_5305 ("node_5305", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _value;
            uniform float4 _node_8090;
            uniform float4 _node_5305;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float3 finalColor = lerp(_node_8090.rgb,_node_5305.rgb,_value);
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
