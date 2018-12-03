// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33506,y:32559,varname:node_9361,prsc:2|emission-7886-RGB,custl-4912-OUT,alpha-2338-OUT;n:type:ShaderForge.SFN_Fresnel,id:6419,x:32622,y:32609,varname:node_6419,prsc:2|EXP-2124-OUT;n:type:ShaderForge.SFN_Slider,id:2124,x:32123,y:32744,ptovrint:False,ptlb:fresnelex,ptin:_fresnelex,varname:node_2124,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:3;n:type:ShaderForge.SFN_DepthBlend,id:6441,x:32680,y:33126,varname:node_6441,prsc:2|DIST-5514-OUT;n:type:ShaderForge.SFN_Slider,id:5514,x:32177,y:33186,ptovrint:False,ptlb:depth,ptin:_depth,varname:node_5514,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_OneMinus,id:8840,x:32873,y:33103,varname:node_8840,prsc:2|IN-6441-OUT;n:type:ShaderForge.SFN_Color,id:8341,x:32530,y:32806,ptovrint:False,ptlb:fresnelcolor,ptin:_fresnelcolor,varname:node_8341,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:96,x:32893,y:32699,varname:node_96,prsc:2|A-6419-OUT,B-8341-RGB,C-7505-OUT;n:type:ShaderForge.SFN_Add,id:4912,x:33180,y:32792,varname:node_4912,prsc:2|A-96-OUT,B-8840-OUT;n:type:ShaderForge.SFN_Tex2d,id:7886,x:32858,y:32422,ptovrint:False,ptlb:Main,ptin:_Main,varname:node_7886,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:7505,x:32321,y:33019,ptovrint:False,ptlb:fresnelpower,ptin:_fresnelpower,varname:node_7505,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_Slider,id:2338,x:32843,y:32620,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_2338,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:2124-5514-8341-7886-7505-2338;pass:END;sub:END;*/

Shader "Shader Forge/new fresnel" {
    Properties {
        _fresnelex ("fresnelex", Range(0, 3)) = 2
        _depth ("depth", Range(0, 1)) = 0
        [HDR]_fresnelcolor ("fresnelcolor", Color) = (0.5,0.5,0.5,1)
        _Main ("Main", 2D) = "white" {}
        _fresnelpower ("fresnelpower", Range(0, 5)) = 0
        _opacity ("opacity", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _CameraDepthTexture;
            uniform float _fresnelex;
            uniform float _depth;
            uniform float4 _fresnelcolor;
            uniform sampler2D _Main; uniform float4 _Main_ST;
            uniform float _fresnelpower;
            uniform float _opacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
////// Emissive:
                float4 _Main_var = tex2D(_Main,TRANSFORM_TEX(i.uv0, _Main));
                float3 emissive = _Main_var.rgb;
                float3 finalColor = emissive + ((pow(1.0-max(0,dot(normalDirection, viewDirection)),_fresnelex)*_fresnelcolor.rgb*_fresnelpower)+(1.0 - saturate((sceneZ-partZ)/_depth)));
                fixed4 finalRGBA = fixed4(finalColor,_opacity);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
