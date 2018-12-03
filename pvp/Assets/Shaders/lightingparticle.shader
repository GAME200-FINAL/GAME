// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-3312-OUT,refract-8139-OUT;n:type:ShaderForge.SFN_Slider,id:5328,x:31529,y:33056,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_5328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Tex2d,id:3875,x:32190,y:32428,ptovrint:False,ptlb:Main,ptin:_Main,varname:node_3875,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bdaee047fbb74d94aaed9d25ea970374,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5194,x:32427,y:32474,varname:node_5194,prsc:2|A-3875-RGB,B-3875-A;n:type:ShaderForge.SFN_Color,id:2663,x:32365,y:32655,ptovrint:False,ptlb:particalcolor,ptin:_particalcolor,varname:node_2663,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3312,x:32791,y:32541,varname:node_3312,prsc:2|A-5194-OUT,B-2663-RGB,C-3610-OUT,D-1571-OUT;n:type:ShaderForge.SFN_Slider,id:3610,x:32252,y:32884,ptovrint:False,ptlb:colorvalue,ptin:_colorvalue,varname:node_3610,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_VertexColor,id:5957,x:32307,y:33005,varname:node_5957,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1571,x:32550,y:32988,varname:node_1571,prsc:2|A-5957-RGB,B-5957-A;n:type:ShaderForge.SFN_Tex2d,id:3140,x:32307,y:33193,ptovrint:False,ptlb:distort,ptin:_distort,varname:node_3140,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:8005,x:32574,y:33266,varname:node_8005,prsc:2|A-3140-R,B-3140-G;n:type:ShaderForge.SFN_Multiply,id:8139,x:32930,y:33237,varname:node_8139,prsc:2|A-8005-OUT,B-8788-OUT,C-3140-A;n:type:ShaderForge.SFN_Slider,id:8788,x:32531,y:33470,ptovrint:False,ptlb:distortvalue,ptin:_distortvalue,varname:node_8788,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;proporder:5328-3875-2663-3610-3140-8788;pass:END;sub:END;*/

Shader "Shader Forge/lightingparticle" {
    Properties {
        _Gloss ("Gloss", Range(0, 1)) = 0.5
        _Main ("Main", 2D) = "white" {}
        [HDR]_particalcolor ("particalcolor", Color) = (0.5,0.5,0.5,1)
        _colorvalue ("colorvalue", Range(0, 5)) = 0
        _distort ("distort", 2D) = "white" {}
        _distortvalue ("distortvalue", Range(0, 2)) = 0
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
            Blend One One
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
            uniform sampler2D _Main; uniform float4 _Main_ST;
            uniform float4 _particalcolor;
            uniform float _colorvalue;
            uniform sampler2D _distort; uniform float4 _distort_ST;
            uniform float _distortvalue;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _distort_var = tex2D(_distort,TRANSFORM_TEX(i.uv0, _distort));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (float2(_distort_var.r,_distort_var.g)*_distortvalue*_distort_var.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float4 _Main_var = tex2D(_Main,TRANSFORM_TEX(i.uv0, _Main));
                float3 finalColor = ((_Main_var.rgb*_Main_var.a)*_particalcolor.rgb*_colorvalue*(i.vertexColor.rgb*i.vertexColor.a));
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,1),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
