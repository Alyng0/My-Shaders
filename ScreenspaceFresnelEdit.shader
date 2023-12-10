// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32813,y:32789,varname:node_3138,prsc:2|emission-3830-OUT,custl-8422-OUT,alpha-1508-OUT;n:type:ShaderForge.SFN_Tex2d,id:2364,x:31829,y:32853,ptovrint:False,ptlb:Background Texture,ptin:_BackgroundTexture,varname:_BackgroundTexture,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:881c304491028ea48b5027ac6c62cf73,ntxv:0,isnm:False|UVIN-3752-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3830,x:32451,y:32903,varname:node_3830,prsc:2|A-6807-OUT,B-3651-OUT;n:type:ShaderForge.SFN_Fresnel,id:1009,x:31997,y:32608,varname:node_1009,prsc:2|EXP-7260-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7260,x:31819,y:32608,ptovrint:False,ptlb:Fresnel Size,ptin:_FresnelSize,varname:_FresnelSize,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:1233,x:32007,y:32746,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8422,x:32424,y:32648,varname:node_8422,prsc:2|A-1111-OUT,B-6807-OUT;n:type:ShaderForge.SFN_Desaturate,id:9085,x:32027,y:33048,varname:node_9085,prsc:2|COL-2364-RGB,DES-7585-OUT;n:type:ShaderForge.SFN_ToggleProperty,id:7585,x:31839,y:33086,ptovrint:False,ptlb:Grayscale Texture,ptin:_GrayscaleTexture,varname:_GrayscaleTexture,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_ToggleProperty,id:2080,x:31654,y:32421,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:_Fresnel,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True;n:type:ShaderForge.SFN_Multiply,id:1111,x:31993,y:32464,varname:node_1111,prsc:2|A-2080-OUT,B-8281-OUT,C-1009-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8281,x:31653,y:32534,ptovrint:False,ptlb:Fresnel Strength,ptin:_FresnelStrength,varname:_FresnelStrength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:9410,x:32249,y:33141,ptovrint:False,ptlb:Glow,ptin:_Glow,varname:_Glow,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:3651,x:32210,y:32954,varname:node_3651,prsc:2|A-8827-OUT,B-9085-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8827,x:32030,y:32952,ptovrint:False,ptlb:Texture Brightness,ptin:_TextureBrightness,varname:_TextureBrightness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Panner,id:3752,x:31513,y:33141,varname:node_3752,prsc:2,spu:1,spv:1|UVIN-7400-UVOUT,DIST-9048-OUT;n:type:ShaderForge.SFN_ScreenPos,id:7400,x:31340,y:32983,varname:node_7400,prsc:2,sctp:0;n:type:ShaderForge.SFN_Multiply,id:9048,x:31347,y:33226,varname:node_9048,prsc:2|A-8797-XYZ,B-685-T;n:type:ShaderForge.SFN_Time,id:685,x:31060,y:33267,varname:node_685,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:8797,x:31145,y:33085,ptovrint:False,ptlb:Texture Direction,ptin:_TextureDirection,varname:_TextureDirection,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_SwitchProperty,id:6807,x:32197,y:32711,ptovrint:False,ptlb:Custom Colors,ptin:_CustomColors,varname:_CustomColors,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1233-RGB,B-1233-RGB;n:type:ShaderForge.SFN_Multiply,id:1508,x:32601,y:33093,varname:node_1508,prsc:2|A-1111-OUT,B-9410-OUT;proporder:1233-6807-2364-8797-8827-9410-7585-2080-8281-7260;pass:END;sub:END;*/

Shader "BeatSaber/Alyng/3DGE/ScreenspaceFresnelEdit" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        [MaterialToggle] _CustomColors ("Custom Colors", Float ) = 1
        _BackgroundTexture ("Background Texture", 2D) = "white" {}
        _TextureDirection ("Texture Direction", Vector) = (0,0,0,0)
        _TextureBrightness ("Texture Brightness", Float ) = 1
        _Glow ("Glow", Range(0, 1)) = 0
        [MaterialToggle] _GrayscaleTexture ("Grayscale Texture", Float ) = 0
        [MaterialToggle] _Fresnel ("Fresnel", Float ) = 1
        _FresnelStrength ("Fresnel Strength", Float ) = 1
        _FresnelSize ("Fresnel Size", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _BackgroundTexture; uniform float4 _BackgroundTexture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelSize)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _GrayscaleTexture)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _Fresnel)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelStrength)
                UNITY_DEFINE_INSTANCED_PROP( float, _Glow)
                UNITY_DEFINE_INSTANCED_PROP( float, _TextureBrightness)
                UNITY_DEFINE_INSTANCED_PROP( float4, _TextureDirection)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _CustomColors)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 _CustomColors_var = lerp( _Color_var.rgb, _Color_var.rgb, UNITY_ACCESS_INSTANCED_PROP( Props, _CustomColors ) );
                float _TextureBrightness_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TextureBrightness );
                float4 _TextureDirection_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TextureDirection );
                float4 node_685 = _Time;
                float2 node_3752 = ((sceneUVs * 2 - 1).rg+(_TextureDirection_var.rgb*node_685.g)*float2(1,1));
                float4 _BackgroundTexture_var = tex2D(_BackgroundTexture,TRANSFORM_TEX(node_3752, _BackgroundTexture));
                float _GrayscaleTexture_var = UNITY_ACCESS_INSTANCED_PROP( Props, _GrayscaleTexture );
                float3 emissive = (_CustomColors_var*(_TextureBrightness_var*lerp(_BackgroundTexture_var.rgb,dot(_BackgroundTexture_var.rgb,float3(0.3,0.59,0.11)),_GrayscaleTexture_var)));
                float _Fresnel_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Fresnel );
                float _FresnelStrength_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelStrength );
                float _FresnelSize_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelSize );
                float node_1111 = (_Fresnel_var*_FresnelStrength_var*pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelSize_var));
                float3 finalColor = emissive + (node_1111*_CustomColors_var);
                float _Glow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Glow );
                return fixed4(finalColor,(node_1111*_Glow_var));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
