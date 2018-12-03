// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33253,y:32770,varname:node_9361,prsc:2|custl-2494-OUT,alpha-7028-OUT,refract-9777-OUT;n:type:ShaderForge.SFN_Fresnel,id:754,x:32571,y:32707,varname:node_754,prsc:2|EXP-5941-OUT;n:type:ShaderForge.SFN_Color,id:4148,x:32416,y:32502,ptovrint:False,ptlb:node_4148,ptin:_node_4148,varname:node_4148,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2494,x:32750,y:32604,varname:node_2494,prsc:2|A-4148-RGB,B-754-OUT;n:type:ShaderForge.SFN_Slider,id:5941,x:32212,y:32922,ptovrint:False,ptlb:fresnel,ptin:_fresnel,varname:node_5941,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.906597,max:10;n:type:ShaderForge.SFN_Slider,id:7028,x:32621,y:32890,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_7028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:9495,x:32336,y:33093,ptovrint:False,ptlb:main,ptin:_main,varname:node_9495,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:3384,x:32624,y:33152,varname:node_3384,prsc:2|A-9495-R,B-9495-G;n:type:ShaderForge.SFN_Multiply,id:9777,x:32844,y:33142,varname:node_9777,prsc:2|A-3384-OUT,B-9495-A,C-5860-OUT,D-1713-A;n:type:ShaderForge.SFN_Slider,id:5860,x:32249,y:33328,ptovrint:False,ptlb:distort,ptin:_distort,varname:node_5860,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5222922,max:1;n:type:ShaderForge.SFN_VertexColor,id:1713,x:32534,y:32997,varname:node_1713,prsc:2;proporder:4148-5941-7028-9495-5860;pass:END;sub:END;*/

Shader "Shader Forge/refractionfresnel" {
    Properties {
        [HDR]_node_4148 ("node_4148", Color) = (0.5,0.5,0.5,1)
        _fresnel ("fresnel", Range(0, 10)) = 1.906597
        _opacity ("opacity", Range(0, 1)) = 0
        _main ("main", 2D) = "white" {}
        _distort ("distort", Range(0, 1)) = 0.5222922
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
            uniform sampler2D _GrabTexture;
            uniform float4 _node_4148;
            uniform float _fresnel;
            uniform float _opacity;
            uniform sampler2D _main; uniform float4 _main_ST;
            uniform float _distort;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
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
                float4 _main_var = tex2D(_main,TRANSFORM_TEX(i.uv0, _main));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (float2(_main_var.r,_main_var.g)*_main_var.a*_distort*i.vertexColor.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = (_node_4148.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),_fresnel));
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,_opacity),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
