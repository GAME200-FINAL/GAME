// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:33243,y:32986,varname:node_4795,prsc:2|emission-852-RGB,clip-8487-R;n:type:ShaderForge.SFN_TexCoord,id:5327,x:31910,y:32935,varname:node_5327,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9828,x:32267,y:33173,varname:node_9828,prsc:2|A-5327-UVOUT,B-2032-OUT;n:type:ShaderForge.SFN_Tex2d,id:8487,x:31757,y:33402,ptovrint:False,ptlb:original,ptin:_original,varname:node_8487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:4961,x:31958,y:33449,varname:node_4961,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-8487-RGB;n:type:ShaderForge.SFN_TexCoord,id:3413,x:32307,y:33663,varname:node_3413,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ProjectionParameters,id:9811,x:32307,y:33850,varname:node_9811,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:4623,x:32555,y:33663,varname:node_4623,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-3413-UVOUT;n:type:ShaderForge.SFN_Append,id:6908,x:32612,y:33888,varname:node_6908,prsc:2|A-9811-SGN,B-8819-OUT;n:type:ShaderForge.SFN_Vector1,id:8819,x:32353,y:34053,varname:node_8819,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:476,x:32855,y:33715,varname:node_476,prsc:2|A-4623-OUT,B-6908-OUT;n:type:ShaderForge.SFN_Multiply,id:4865,x:32236,y:33426,varname:node_4865,prsc:2|A-4961-OUT,B-4922-OUT;n:type:ShaderForge.SFN_Vector1,id:4922,x:32056,y:33586,varname:node_4922,prsc:2,v1:2;n:type:ShaderForge.SFN_Subtract,id:2032,x:32566,y:33417,varname:node_2032,prsc:2|A-4865-OUT,B-3696-OUT;n:type:ShaderForge.SFN_Vector1,id:3696,x:32335,y:33555,varname:node_3696,prsc:2,v1:1;n:type:ShaderForge.SFN_SceneColor,id:852,x:32532,y:33112,varname:node_852,prsc:2|UVIN-9828-OUT;proporder:8487;pass:END;sub:END;*/

Shader "Shader Forge/particledistort" {
    Properties {
        _original ("original", 2D) = "white" {}
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
            uniform sampler2D _original; uniform float4 _original_ST;
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
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float4 _original_var = tex2D(_original,TRANSFORM_TEX(i.uv0, _original));
                clip(_original_var.r - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = tex2D( _GrabTexture, (i.uv0+((_original_var.rgb.rg*2.0)-1.0))).rgb;
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
