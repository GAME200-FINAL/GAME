// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-6496-OUT,alpha-2888-OUT,refract-1543-OUT;n:type:ShaderForge.SFN_Tex2d,id:3407,x:32006,y:32820,ptovrint:False,ptlb:,ptin:_,varname:node_3407,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e085ddac1cdcfa349b23d1c8439a5be1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:564,x:32375,y:32808,varname:node_564,prsc:2|A-3407-R,B-3407-G;n:type:ShaderForge.SFN_Multiply,id:1543,x:32690,y:33050,varname:node_1543,prsc:2|A-564-OUT,B-4744-OUT,C-3407-A;n:type:ShaderForge.SFN_Slider,id:4744,x:32198,y:33149,ptovrint:False,ptlb:refraction,ptin:_refraction,varname:node_4744,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6714305,max:10;n:type:ShaderForge.SFN_Color,id:5951,x:32169,y:32422,ptovrint:False,ptlb:node_5951,ptin:_node_5951,varname:node_5951,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.684,c2:0.8433014,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6496,x:32735,y:32571,varname:node_6496,prsc:2|A-3742-OUT,B-3407-RGB,C-3407-A;n:type:ShaderForge.SFN_Slider,id:2888,x:32441,y:32377,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_2888,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:3742,x:32427,y:32522,varname:node_3742,prsc:2|A-5951-RGB,B-5195-OUT;n:type:ShaderForge.SFN_Slider,id:5195,x:32060,y:32598,ptovrint:False,ptlb:color,ptin:_color,varname:node_5195,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;proporder:3407-4744-5951-2888-5195;pass:END;sub:END;*/

Shader "Shader Forge/distort" {
    Properties {
        _ ("", 2D) = "white" {}
        _refraction ("refraction", Range(0, 10)) = 0.6714305
        [HDR]_node_5951 ("node_5951", Color) = (0.684,0.8433014,1,1)
        _opacity ("opacity", Range(0, 1)) = 0
        _color ("color", Range(0, 10)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha
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
            uniform sampler2D _GrabTexture;
            uniform sampler2D _; uniform float4 __ST;
            uniform float _refraction;
            uniform float4 _node_5951;
            uniform float _opacity;
            uniform float _color;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 __var = tex2D(_,TRANSFORM_TEX(i.uv0, _));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (float2(__var.r,__var.g)*_refraction*__var.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float3 emissive = ((_node_5951.rgb*_color)*__var.rgb*__var.a);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,_opacity),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
