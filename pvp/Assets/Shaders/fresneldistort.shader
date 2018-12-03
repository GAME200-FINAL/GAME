// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-8294-OUT,alpha-5800-OUT;n:type:ShaderForge.SFN_Fresnel,id:4999,x:32144,y:32903,varname:node_4999,prsc:2|EXP-2759-OUT;n:type:ShaderForge.SFN_Color,id:2848,x:32159,y:32718,ptovrint:False,ptlb:waiyanse,ptin:_waiyanse,varname:node_2848,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3419118,c2:0.5816429,c3:0.9117647,c4:1;n:type:ShaderForge.SFN_Multiply,id:1757,x:32501,y:32675,varname:node_1757,prsc:2|A-2848-RGB,B-4999-OUT;n:type:ShaderForge.SFN_Slider,id:2759,x:31714,y:33014,ptovrint:False,ptlb:fresnel,ptin:_fresnel,varname:node_2759,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.599962,max:10;n:type:ShaderForge.SFN_SceneColor,id:1811,x:32479,y:33094,varname:node_1811,prsc:2|UVIN-8718-UVOUT;n:type:ShaderForge.SFN_Parallax,id:8718,x:32252,y:33134,varname:node_8718,prsc:2|HEI-4229-OUT;n:type:ShaderForge.SFN_Slider,id:4229,x:31863,y:33287,ptovrint:False,ptlb:niuqu ,ptin:_niuqu,varname:node_4229,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:0.3363394,max:10;n:type:ShaderForge.SFN_Add,id:8294,x:32656,y:32868,varname:node_8294,prsc:2|A-1757-OUT,B-1811-RGB;n:type:ShaderForge.SFN_Slider,id:5800,x:32754,y:32746,ptovrint:False,ptlb:touming,ptin:_touming,varname:node_5800,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2240877,max:1;proporder:4229-2848-2759-5800;pass:END;sub:END;*/

Shader "Shader Forge/fresneldistort" {
    Properties {
        _niuqu ("niuqu ", Range(-10, 10)) = 0.3363394
        [HDR]_waiyanse ("waiyanse", Color) = (0.3419118,0.5816429,0.9117647,1)
        _fresnel ("fresnel", Range(0, 10)) = 2.599962
        _touming ("touming", Range(0, 1)) = 0.2240877
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
            uniform float4 _waiyanse;
            uniform float _fresnel;
            uniform float _niuqu;
            uniform float _touming;
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
                UNITY_FOG_COORDS(6)
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
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = ((_waiyanse.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),_fresnel))+tex2D( _GrabTexture, (0.05*(_niuqu - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0).rg).rgb);
                fixed4 finalRGBA = fixed4(finalColor,_touming);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
