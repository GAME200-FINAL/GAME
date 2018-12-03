// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33562,y:32730,varname:node_9361,prsc:2|emission-650-OUT,alpha-2315-OUT,refract-6584-OUT;n:type:ShaderForge.SFN_Tex2d,id:555,x:32369,y:33010,ptovrint:False,ptlb:Main,ptin:_Main,varname:node_555,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:2375,x:32617,y:32994,varname:node_2375,prsc:2|A-555-R,B-555-G;n:type:ShaderForge.SFN_Slider,id:2315,x:32425,y:32825,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_2315,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Append,id:8657,x:32834,y:33404,varname:node_8657,prsc:2|A-6586-OUT,B-5714-OUT;n:type:ShaderForge.SFN_Vector1,id:6586,x:32383,y:33393,varname:node_6586,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:8293,x:32985,y:33290,ptovrint:False,ptlb:node_8293,ptin:_node_8293,varname:node_8293,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8657-OUT;n:type:ShaderForge.SFN_Color,id:6213,x:32952,y:33576,ptovrint:False,ptlb:node_6213,ptin:_node_6213,varname:node_6213,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:650,x:33348,y:33425,varname:node_650,prsc:2|A-8293-RGB,B-6213-RGB,C-8293-A,D-1319-OUT;n:type:ShaderForge.SFN_Multiply,id:6584,x:33042,y:32987,varname:node_6584,prsc:2|A-2375-OUT,B-3398-OUT,C-555-A;n:type:ShaderForge.SFN_Slider,id:3398,x:32660,y:33169,ptovrint:False,ptlb:distort,ptin:_distort,varname:node_3398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-5,cur:0,max:5;n:type:ShaderForge.SFN_Slider,id:1319,x:33080,y:33682,ptovrint:False,ptlb:color,ptin:_color,varname:node_1319,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_RemapRange,id:7365,x:32505,y:33260,varname:node_7365,prsc:2,frmn:0,frmx:1,tomn:-3,tomx:1|IN-555-R;n:type:ShaderForge.SFN_Clamp01,id:5714,x:32660,y:33312,varname:node_5714,prsc:2|IN-7365-OUT;proporder:555-2315-8293-6213-3398-1319;pass:END;sub:END;*/

Shader "Shader Forge/newtrail1" {
    Properties {
        _Main ("Main", 2D) = "white" {}
        _opacity ("opacity", Range(0, 1)) = 0
        _node_8293 ("node_8293", 2D) = "white" {}
        [HDR]_node_6213 ("node_6213", Color) = (0.5,0.5,0.5,1)
        _distort ("distort", Range(-5, 5)) = 0
        _color ("color", Range(0, 5)) = 0
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
            uniform sampler2D _Main; uniform float4 _Main_ST;
            uniform float _opacity;
            uniform sampler2D _node_8293; uniform float4 _node_8293_ST;
            uniform float4 _node_6213;
            uniform float _distort;
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
            float4 frag(VertexOutput i) : COLOR {
                float4 _Main_var = tex2D(_Main,TRANSFORM_TEX(i.uv0, _Main));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (float2(_Main_var.r,_Main_var.g)*_distort*_Main_var.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float2 node_8657 = float2(0.0,saturate((_Main_var.r*4.0+-3.0)));
                float4 _node_8293_var = tex2D(_node_8293,TRANSFORM_TEX(node_8657, _node_8293));
                float3 emissive = (_node_8293_var.rgb*_node_6213.rgb*_node_8293_var.a*_color);
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
