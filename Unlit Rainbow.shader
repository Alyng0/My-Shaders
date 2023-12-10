// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-47-OUT,alpha-6848-OUT;n:type:ShaderForge.SFN_Tex2d,id:6498,x:31810,y:32687,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:_Texture,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6877-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6877,x:31561,y:32577,varname:node_6877,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:47,x:32181,y:32698,varname:node_47,prsc:2|A-3433-OUT,B-6498-RGB;n:type:ShaderForge.SFN_Color,id:8603,x:31811,y:32483,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:3233,x:31538,y:32327,varname:node_3233,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:560,x:31373,y:32145,varname:node_560,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:6584,x:31217,y:32040,ptovrint:False,ptlb:RGB Speed,ptin:_RGBSpeed,varname:_RGBSpeed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:2393,x:31532,y:32031,varname:node_2393,prsc:2|A-560-T,B-6584-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8268,x:31548,y:32196,ptovrint:False,ptlb:RGB Scale,ptin:_RGBScale,varname:_RGBScale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Hue,id:6640,x:31811,y:32347,varname:node_6640,prsc:2|IN-6792-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6650,x:31953,y:32244,varname:node_6650,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-4317-UVOUT;n:type:ShaderForge.SFN_Panner,id:4317,x:31901,y:32042,varname:node_4317,prsc:2,spu:1,spv:1|UVIN-8536-OUT,DIST-2393-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:6792,x:32083,y:32144,ptovrint:False,ptlb:Rotate Rainbow,ptin:_RotateRainbow,varname:_RotateRainbow,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4149-OUT,B-6650-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4149,x:32132,y:32001,varname:node_4149,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-4317-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8536,x:31678,y:32196,varname:node_8536,prsc:2|A-8268-OUT,B-3233-UVOUT;n:type:ShaderForge.SFN_SwitchProperty,id:3433,x:32176,y:32452,ptovrint:False,ptlb:Rainbow,ptin:_Rainbow,varname:_Rainbow,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1038-OUT,B-6640-OUT;n:type:ShaderForge.SFN_Slider,id:6848,x:32182,y:33001,ptovrint:False,ptlb:Glow,ptin:_Glow,varname:_Glow,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:1038,x:32006,y:32473,ptovrint:False,ptlb:Custom Colors,ptin:_CustomColors,varname:_CustomColors,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8603-RGB,B-8603-RGB;proporder:8603-1038-6498-6848-3433-6792-6584-8268;pass:END;sub:END;*/

Shader "BeatSaber/Alyng/Unlit Rainbow" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        [MaterialToggle] _CustomColors ("Custom Colors", Float ) = 1
        _Texture ("Texture", 2D) = "white" {}
        _Glow ("Glow", Range(0, 1)) = 0
        [MaterialToggle] _Rainbow ("Rainbow", Float ) = 1
        [MaterialToggle] _RotateRainbow ("Rotate Rainbow", Float ) = 0
        _RGBSpeed ("RGB Speed", Float ) = 0
        _RGBScale ("RGB Scale", Float ) = 1
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
                UNITY_DEFINE_INSTANCED_PROP( float, _RGBSpeed)
                UNITY_DEFINE_INSTANCED_PROP( float, _RGBScale)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _RotateRainbow)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _Rainbow)
                UNITY_DEFINE_INSTANCED_PROP( float, _Glow)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _CustomColors)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 _CustomColors_var = lerp( _Color_var.rgb, _Color_var.rgb, UNITY_ACCESS_INSTANCED_PROP( Props, _CustomColors ) );
                float4 node_560 = _Time;
                float _RGBSpeed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RGBSpeed );
                float _RGBScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RGBScale );
                float2 node_4317 = ((_RGBScale_var*i.uv0)+(node_560.g*_RGBSpeed_var)*float2(1,1));
                float _RotateRainbow_var = lerp( node_4317.g, node_4317.r, UNITY_ACCESS_INSTANCED_PROP( Props, _RotateRainbow ) );
                float3 _Rainbow_var = lerp( _CustomColors_var, saturate(3.0*abs(1.0-2.0*frac(_RotateRainbow_var+float3(0.0,-1.0/3.0,1.0/3.0)))-1), UNITY_ACCESS_INSTANCED_PROP( Props, _Rainbow ) );
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 emissive = (_Rainbow_var*_Texture_var.rgb);
                float3 finalColor = emissive;
                float _Glow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Glow );
                return fixed4(finalColor,_Glow_var);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
