// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:1,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7326-OUT,custl-862-OUT,alpha-4813-OUT;n:type:ShaderForge.SFN_Slider,id:1421,x:32212,y:33166,ptovrint:False,ptlb:Glow,ptin:_Glow,varname:_Glow,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Fresnel,id:5642,x:31932,y:33095,varname:node_5642,prsc:2|EXP-4744-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4744,x:31711,y:33129,ptovrint:False,ptlb:Fresnel EXP,ptin:_FresnelEXP,varname:_FresnelEXP,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:5028,x:31484,y:32938,varname:node_5028,prsc:2,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2057,x:31479,y:33018,ptovrint:False,ptlb:Fresnel Strength,ptin:_FresnelStrength,varname:_FresnelStrength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:329,x:31710,y:32952,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:_Fresnel,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-5028-OUT,B-2057-OUT;n:type:ShaderForge.SFN_Multiply,id:8746,x:31941,y:32942,varname:node_8746,prsc:2|A-329-OUT,B-5642-OUT;n:type:ShaderForge.SFN_Multiply,id:862,x:32197,y:32937,varname:node_862,prsc:2|A-8746-OUT,B-3400-OUT;n:type:ShaderForge.SFN_Multiply,id:4813,x:32525,y:33107,varname:node_4813,prsc:2|A-8746-OUT,B-1421-OUT;n:type:ShaderForge.SFN_Color,id:3217,x:31785,y:32471,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_SwitchProperty,id:3400,x:31986,y:32486,ptovrint:False,ptlb:Custom Colors,ptin:_CustomColors,varname:_CustomColors,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3217-RGB,B-3217-RGB;n:type:ShaderForge.SFN_Multiply,id:7326,x:32392,y:32500,varname:node_7326,prsc:2|A-855-OUT,B-6775-OUT;n:type:ShaderForge.SFN_Tex2d,id:8166,x:31988,y:32684,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:_Texture,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6348-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6348,x:31771,y:32695,varname:node_6348,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:855,x:32172,y:32644,varname:node_855,prsc:2|A-3400-OUT,B-8166-RGB;n:type:ShaderForge.SFN_Slider,id:6775,x:31901,y:32354,ptovrint:False,ptlb:Color Brightness,ptin:_ColorBrightness,varname:_ColorBrightness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:3217-3400-8166-6775-1421-329-4744-2057;pass:END;sub:END;*/

Shader "BeatSaber/Alyng/Unlit Fresnel" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        [MaterialToggle] _CustomColors ("Custom Colors", Float ) = 1
        _Texture ("Texture", 2D) = "white" {}
        _ColorBrightness ("Color Brightness", Range(0, 1)) = 1
        _Glow ("Glow", Range(0, 1)) = 0
        [MaterialToggle] _Fresnel ("Fresnel", Float ) = 1
        _FresnelEXP ("Fresnel EXP", Float ) = 1
        _FresnelStrength ("Fresnel Strength", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _Glow)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelEXP)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelStrength)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _Fresnel)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _CustomColors)
                UNITY_DEFINE_INSTANCED_PROP( float, _ColorBrightness)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 _CustomColors_var = lerp( _Color_var.rgb, _Color_var.rgb, UNITY_ACCESS_INSTANCED_PROP( Props, _CustomColors ) );
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float _ColorBrightness_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ColorBrightness );
                float3 emissive = ((_CustomColors_var*_Texture_var.rgb)*_ColorBrightness_var);
                float _FresnelStrength_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelStrength );
                float _Fresnel_var = lerp( 0.0, _FresnelStrength_var, UNITY_ACCESS_INSTANCED_PROP( Props, _Fresnel ) );
                float _FresnelEXP_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelEXP );
                float node_8746 = (_Fresnel_var*pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelEXP_var));
                float3 finalColor = emissive + (node_8746*_CustomColors_var);
                float _Glow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Glow );
                return fixed4(finalColor,(node_8746*_Glow_var));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
