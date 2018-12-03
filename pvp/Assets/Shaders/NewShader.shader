// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|normal-7556-RGB,custl-9010-OUT;n:type:ShaderForge.SFN_Tex2d,id:1713,x:32278,y:32626,ptovrint:False,ptlb:node_1713,ptin:_node_1713,varname:node_1713,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:677e52c8d108eed4281a92bfffe33f53,ntxv:0,isnm:False;n:type:ShaderForge.SFN_NormalVector,id:8415,x:31830,y:33034,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:9983,x:31815,y:32830,varname:node_9983,prsc:2;n:type:ShaderForge.SFN_Dot,id:9786,x:32169,y:32919,varname:node_9786,prsc:2,dt:1|A-8415-OUT,B-9983-OUT;n:type:ShaderForge.SFN_Multiply,id:6065,x:32563,y:32854,varname:node_6065,prsc:2|A-1713-RGB,B-9786-OUT;n:type:ShaderForge.SFN_HalfVector,id:9835,x:31830,y:33226,varname:node_9835,prsc:2;n:type:ShaderForge.SFN_Dot,id:8044,x:32106,y:33239,varname:node_8044,prsc:2,dt:1|A-8415-OUT,B-9835-OUT;n:type:ShaderForge.SFN_Power,id:9052,x:32380,y:33238,varname:node_9052,prsc:2|VAL-8044-OUT,EXP-34-OUT;n:type:ShaderForge.SFN_Exp,id:34,x:32223,y:33389,varname:node_34,prsc:2,et:0|IN-6647-OUT;n:type:ShaderForge.SFN_Slider,id:6647,x:31829,y:33483,ptovrint:False,ptlb:node_6647,ptin:_node_6647,varname:node_6647,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.102564,max:10;n:type:ShaderForge.SFN_Multiply,id:8374,x:32639,y:33165,varname:node_8374,prsc:2|A-9052-OUT,B-8489-OUT;n:type:ShaderForge.SFN_Slider,id:8489,x:32453,y:33381,ptovrint:False,ptlb:node_8489,ptin:_node_8489,varname:node_8489,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.709402,max:5;n:type:ShaderForge.SFN_Add,id:9010,x:32767,y:33004,varname:node_9010,prsc:2|A-6065-OUT,B-8374-OUT;n:type:ShaderForge.SFN_Tex2d,id:7556,x:32726,y:32664,ptovrint:False,ptlb:node_7556,ptin:_node_7556,varname:node_7556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:1713-6647-8489-7556;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _node_1713 ("node_1713", 2D) = "white" {}
        _node_6647 ("node_6647", Range(0, 10)) = 4.102564
        _node_8489 ("node_8489", Range(0, 5)) = 1.709402
        _node_7556 ("node_7556", 2D) = "white" {}
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
            uniform sampler2D _node_1713; uniform float4 _node_1713_ST;
            uniform float _node_6647;
            uniform float _node_8489;
            uniform sampler2D _node_7556; uniform float4 _node_7556_ST;
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
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
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
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _node_7556_var = tex2D(_node_7556,TRANSFORM_TEX(i.uv0, _node_7556));
                float3 normalLocal = _node_7556_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _node_1713_var = tex2D(_node_1713,TRANSFORM_TEX(i.uv0, _node_1713));
                float3 finalColor = ((_node_1713_var.rgb*max(0,dot(i.normalDir,lightDirection)))+(pow(max(0,dot(i.normalDir,halfDirection)),exp(_node_6647))*_node_8489));
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
            uniform sampler2D _node_1713; uniform float4 _node_1713_ST;
            uniform float _node_6647;
            uniform float _node_8489;
            uniform sampler2D _node_7556; uniform float4 _node_7556_ST;
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
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
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
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _node_7556_var = tex2D(_node_7556,TRANSFORM_TEX(i.uv0, _node_7556));
                float3 normalLocal = _node_7556_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _node_1713_var = tex2D(_node_1713,TRANSFORM_TEX(i.uv0, _node_1713));
                float3 finalColor = ((_node_1713_var.rgb*max(0,dot(i.normalDir,lightDirection)))+(pow(max(0,dot(i.normalDir,halfDirection)),exp(_node_6647))*_node_8489));
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
