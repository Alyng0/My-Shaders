// Made with Amplify Shader Editor v1.9.1.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BeatSaber/Alyng/Alyngs FireTrail V2"
{
	Properties 
  { 
      [HideInInspector] shader_is_using_thry_editor("", Float)=0
		[HideInInspector]m_start_ShaderOptions("Shader Options", Float) = 0
		[ThryWideEnum(Glow, 16, No Glow, 14)]_ThryEnumPreview("Glow Options", Float) = 0
		[HideInInspector]m_end_ShaderOptions("Shader Options", Float) = 0
		[HideInInspector]m_start_MainSettings("Main Settings", Float) = 0
		_Color("Color", Color) = (1,1,1,1)
		[Toggle(_CUSTOMCOLORS_ON)] _CustomColors("Custom Colors", Float) = 0
		[Toggle(_USEVERTEXCOLOR_ON)] _UseVertexColor("Use Vertex Color", Float) = 0
		[Toggle(_GAMMACORRECTEDVERTEXCOLOR_ON)] _GammaCorrectedVertexColor("Gamma Corrected Vertex Color", Float) = 0
		_ColorIntensity("Color Intensity", Float) = 1
		_Glow("Glow", Float) = 1
		[HideInInspector]m_end_MainSettings("Main Settings", Float) = 0
		[HideInInspector]m_start_TextureSettings("Texture Settings", Float) = 0
		[BigTexture]_BigTexturePreview("Main Texture", 2D) = "white" {}
		[BigTexture]_BigTexturePreview2("Displacement 1", 2D) = "black" {}
		_Displacement1Speed("Displacement 1 Speed", Vector) = (0,0,0,0)
		_Displacement1Strength("Displacement 1 Strength", Float) = 0.2
		[BigTexture]_BigTexturePreview1("Displacement 2", 2D) = "black" {}
		_Displacement2Speed("Displacement 2 Speed", Vector) = (0,0,0,0)
		_Displacement2Strength("Displacement 2 Strength", Float) = 0.2
		[BigTexture]_BigTexturePreview3("Fade Mask", 2D) = "white" {}
		[HideInInspector]m_end_TextureSettings("Texture Settings", Float) = 0
		[HideInInspector]m_start_Gradient("Gradient", Float) = 0
		[Toggle(_GRADIENT_ON)] _Gradient("Gradient", Float) = 0
		[Toggle(_COLORGRADIENT_ON)] _ColorGradient("Color Gradient", Float) = 0
		[Gradient]_GradientPreview("Gradient Preview", 2D) = "white" {}
		[Toggle]_GradientRotate("Gradient Rotate", Float) = 0
		_GradientSpeed("Gradient Speed", Float) = 1
		_GradientSize("Gradient Size", Float) = 1
		[HideInInspector]m_end_Gradient("Gradient", Float) = 0
		[HideInInspector]footer_KoFi("{text:Discord,action:{type:URL,data:https://discord.com/invite/n8qTVEwPcr},hover:Discord}", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Transparent+3000" "IgnoreProjector" = "True" "IsEmissive" = "true"  "PreviewType"="Plane" }
		LOD 100
		Cull Off
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		BlendOp Add
		ColorMask [_ThryEnumPreview]
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _GRADIENT_ON
		#pragma shader_feature_local _CUSTOMCOLORS_ON
		#pragma shader_feature_local _USEVERTEXCOLOR_ON
		#pragma shader_feature_local _GAMMACORRECTEDVERTEXCOLOR_ON
		#pragma shader_feature_local _COLORGRADIENT_ON
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform float _ThryEnumPreview;
		uniform sampler2D _BigTexturePreview;
		uniform float _Displacement1Strength;
		uniform sampler2D _BigTexturePreview2;
		uniform float4 _Displacement1Speed;
		uniform float4 _BigTexturePreview2_ST;
		uniform float _Displacement2Strength;
		uniform sampler2D _BigTexturePreview1;
		uniform float4 _Displacement2Speed;
		uniform float4 _BigTexturePreview1_ST;
		uniform float4 _BigTexturePreview_ST;
		uniform float4 _Color;
		uniform sampler2D _GradientPreview;
		uniform float _GradientSpeed;
		uniform float _GradientRotate;
		uniform float _GradientSize;
		uniform float _ColorIntensity;
		uniform sampler2D _BigTexturePreview3;
		uniform float _Glow;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 uv_BigTexturePreview2 = i.uv_texcoord * _BigTexturePreview2_ST.xy + _BigTexturePreview2_ST.zw;
			float2 panner37 = ( 1.0 * _Time.y * _Displacement1Speed.xy + uv_BigTexturePreview2);
			float2 uv_BigTexturePreview1 = i.uv_texcoord * _BigTexturePreview1_ST.xy + _BigTexturePreview1_ST.zw;
			float2 panner46 = ( 1.0 * _Time.y * _Displacement2Speed.xy + uv_BigTexturePreview1);
			float4 Distortions50 = ( ( _Displacement1Strength * tex2D( _BigTexturePreview2, panner37 ) ) + ( _Displacement2Strength * tex2D( _BigTexturePreview1, panner46 ) ) );
			float2 uv_BigTexturePreview = i.uv_texcoord * _BigTexturePreview_ST.xy + _BigTexturePreview_ST.zw;
			float grayscale123 = (tex2D( _BigTexturePreview, ( Distortions50 + float4( uv_BigTexturePreview, 0.0 , 0.0 ) ).rg ).rgb.r + tex2D( _BigTexturePreview, ( Distortions50 + float4( uv_BigTexturePreview, 0.0 , 0.0 ) ).rg ).rgb.g + tex2D( _BigTexturePreview, ( Distortions50 + float4( uv_BigTexturePreview, 0.0 , 0.0 ) ).rg ).rgb.b) / 3;
			float MainTexture26 = grayscale123;
			float4 temp_cast_5 = (2.2).xxxx;
			#ifdef _GAMMACORRECTEDVERTEXCOLOR_ON
				float4 staticSwitch140 = pow( i.vertexColor , temp_cast_5 );
			#else
				float4 staticSwitch140 = i.vertexColor;
			#endif
			#ifdef _USEVERTEXCOLOR_ON
				float4 staticSwitch52 = staticSwitch140;
			#else
				float4 staticSwitch52 = _Color;
			#endif
			#ifdef _CUSTOMCOLORS_ON
				float4 staticSwitch23 = staticSwitch52;
			#else
				float4 staticSwitch23 = staticSwitch52;
			#endif
			float4 Color22 = staticSwitch23;
			float mulTime14 = _Time.y * _GradientSpeed;
			float2 temp_cast_6 = (_GradientSize).xx;
			float2 uv_TexCoord11 = i.uv_texcoord * temp_cast_6;
			float2 temp_cast_7 = (( fmod( mulTime14 , 7200.0 ) + (( _GradientRotate )?( uv_TexCoord11.y ):( uv_TexCoord11.x )) )).xx;
			float4 GradientOut96 = tex2D( _GradientPreview, temp_cast_7 );
			float grayscale106 = (( GradientOut96 * MainTexture26 ).rgb.r + ( GradientOut96 * MainTexture26 ).rgb.g + ( GradientOut96 * MainTexture26 ).rgb.b) / 3;
			float GlowGradient107 = grayscale106;
			#ifdef _COLORGRADIENT_ON
				float4 staticSwitch114 = ( ( GlowGradient107 * MainTexture26 ) * Color22 );
			#else
				float4 staticSwitch114 = ( GradientOut96 * MainTexture26 );
			#endif
			#ifdef _GRADIENT_ON
				float4 staticSwitch119 = staticSwitch114;
			#else
				float4 staticSwitch119 = ( MainTexture26 * Color22 );
			#endif
			float4 tex2DNode160 = tex2D( _BigTexturePreview3, uv_BigTexturePreview );
			float4 Final82 = ( ( staticSwitch119 * _ColorIntensity ) * tex2DNode160 );
			o.Emission = Final82.rgb;
			o.Alpha = ( _Glow * tex2DNode160 * MainTexture26 ).r;
		}

		ENDCG
	}
	CustomEditor "Thry.ShaderEditor"
}
/*ASEBEGIN
Version=19107
Node;AmplifyShaderEditor.CommentaryNode;5;-2450.658,-1030.928;Inherit;False;330;259;Requires Thry Material Editor;1;4;;1,1,1,1;0;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;32;0,0;Float;False;True;-1;2;Thry.ShaderEditor;100;0;Unlit;BeatSaber/Alyng/Alyngs FireTrail V2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;2;False;;0;False;;False;0;False;;0;False;;False;0;Custom;1;True;False;3000;True;TransparentCutout;;Transparent;All;12;all;True;True;True;True;0;True;_ThryEnumPreview;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;False;;0;1;False;;1;False;;1;False;;1;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;100;;0;-1;-1;-1;1;PreviewType=Plane;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.GetLocalVarNode;83;-253.7461,73.19794;Inherit;False;82;Final;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;4;-2418.657,-982.9279;Inherit;True;Property;_GradientPreview;Gradient Preview;26;0;Create;True;0;0;0;False;1;Gradient;False;-1;9fc0b4f3f302c7c40943b5ea3f5c3cbf;9fc0b4f3f302c7c40943b5ea3f5c3cbf;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-250.4171,268.0291;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-3394.658,-870.928;Inherit;False;Property;_GradientSize;Gradient Size;29;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-3266.658,-1158.928;Inherit;True;Property;_GradientSpeed;Gradient Speed;28;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;23;-3186.658,-582.9279;Inherit;False;Property;_CustomColors;Custom Colors;7;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;52;-3458.658,-678.9279;Inherit;False;Property;_UseVertexColor;Use Vertex Color;8;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;11;-3202.658,-886.9279;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;22;-2898.658,-550.9278;Inherit;False;Color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;16;-2946.658,-870.928;Inherit;False;Property;_GradientRotate;Gradient Rotate;27;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;14;-3026.658,-1126.928;Inherit;True;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FmodOpNode;15;-2802.658,-1014.928;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;7200;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-2674.658,-982.9279;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;96;-2050.657,-1014.928;Inherit;True;GradientOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCGrayscale;106;-389.4703,-399.8917;Inherit;True;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;105;-772.4703,-419.8917;Inherit;False;96;GradientOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;134;-771.8606,-336.5377;Inherit;False;26;MainTexture;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;133;-548.0552,-399.9943;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;10;-3893.658,-785.9279;Inherit;False;Property;_Color;Color;6;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;140;-3697.253,-480.7269;Inherit;False;Property;_GammaCorrectedVertexColor;Gamma Corrected Vertex Color;9;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;141;-3953.853,-578.0267;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;55;-4141.157,-318.5275;Inherit;False;Constant;_Float1;Float 1;25;0;Create;True;0;0;0;False;0;False;2.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;53;-4141.157,-494.5274;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;54;-3946.859,-423.8273;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;36;-3794.658,329.0722;Inherit;False;Property;_Displacement1Speed;Displacement 1 Speed;16;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;37;-3538.658,249.0723;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-3330.658,137.072;Inherit;False;Property;_Displacement1Strength;Displacement 1 Strength;17;0;Create;True;0;0;0;False;0;False;7.34;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;46;-3554.658,585.0724;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;45;-3810.658,665.0724;Inherit;False;Property;_Displacement2Speed;Displacement 2 Speed;19;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;48;-3346.658,473.0723;Inherit;False;Property;_Displacement2Strength;Displacement 2 Strength;20;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;35;-3794.658,217.0721;Inherit;False;0;68;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;44;-3810.658,553.0723;Inherit;False;0;67;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-3090.658,505.0723;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;41;-2882.658,329.0722;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-3074.658,169.0722;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;-2709.735,315.4593;Inherit;False;Distortions;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-1944.597,-647.7646;Inherit;False;Property;_shader_is_using_thry_editor;shader_is_using_thry_editor;1;1;[HideInInspector];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;67;-3378.658,553.0723;Inherit;True;Property;_BigTexturePreview1;Displacement 2;18;0;Create;False;0;0;0;True;1;BigTexture;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;81;-464.1439,242.9995;Inherit;False;Property;_Glow;Glow;11;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;153;-1927.816,-338.5746;Inherit;False;Property;footer_KoFi;{text:Discord,action:{type:URL,data:https://discord.com/invite/n8qTVEwPcr},hover:Discord};31;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1725.313,-560.6;Inherit;False;Property;m_start_MainSettings;Main Settings;5;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-1710.184,-444.1023;Inherit;False;Property;m_end_MainSettings;Main Settings;12;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;156;-1523.271,-559.4597;Inherit;False;Property;m_start_Gradient;Gradient;23;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;157;-1509.142,-442.962;Inherit;False;Property;m_end_Gradient;Gradient;30;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;107;-134.055,-393.5152;Inherit;True;GlowGradient;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-1192.738,-273.111;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;121;-1396.586,-162.8664;Inherit;False;22;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;58;-1398.519,-263.3544;Inherit;False;26;MainTexture;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;127;-1638.727,18.69922;Inherit;False;26;MainTexture;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;117;-1638.204,-56.14581;Inherit;False;96;GradientOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;126;-1370.727,-18.30079;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;111;-1241.212,242.1446;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;122;-1400.87,191.1968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;124;-1680.727,280.6991;Inherit;False;26;MainTexture;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;9;-1465.317,312.8953;Inherit;False;22;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;114;-939.5029,181.2001;Inherit;False;Property;_ColorGradient;Color Gradient;25;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;119;-924.2976,-103.9458;Inherit;False;Property;_Gradient;Gradient;24;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;82;-215.631,-77.59863;Inherit;False;Final;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-854.3619,287.5564;Inherit;False;Property;_ColorIntensity;Color Intensity;10;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;68;-3346.658,217.0721;Inherit;True;Property;_BigTexturePreview2;Displacement 1;15;0;Create;False;0;0;0;True;1;BigTexture;False;-1;2fba45d5ac17e8349993d19632cc6e72;2fba45d5ac17e8349993d19632cc6e72;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;138;-653.5313,-147.5811;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;163;-363.668,-139.8521;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;160;-693.7872,15.27783;Inherit;True;Property;_BigTexturePreview3;Fade Mask;21;0;Create;False;0;0;0;True;1;BigTexture;False;-1;3b31c892105074b4e9c8f390b54c134a;3b31c892105074b4e9c8f390b54c134a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;162;-970.9,36.50835;Inherit;False;0;66;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;57;-1674.019,180.509;Inherit;False;107;GlowGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;164;-487.0848,339.8054;Inherit;False;26;MainTexture;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;63;-1912.605,-443.6679;Inherit;False;Property;m_end_TextureSettings;Texture Settings;22;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-1917.29,-558.6105;Inherit;False;Property;m_start_TextureSettings;Texture Settings;13;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;176;-2122.95,-546.6727;Inherit;False;Property;m_start_ShaderOptions;Shader Options;2;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;175;-2118.658,-445.8109;Inherit;False;Property;m_end_ShaderOptions;Shader Options;4;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;166;-3139.735,-236.7654;Inherit;True;Property;_TextureSample0;Texture Sample 0;14;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;66;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;66;-3164.257,-457.728;Inherit;True;Property;_BigTexturePreview;Main Texture;14;0;Create;False;0;0;0;True;1;BigTexture;False;-1;23bfa395042daa041bf76c01286404f4;23bfa395042daa041bf76c01286404f4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;72;-3611.175,-124.6647;Inherit;True;0;66;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;51;-3620.153,-333.3246;Inherit;True;50;Distortions;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;185;-3351.069,-220.6266;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCGrayscale;123;-2773.579,-213.6071;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-2564.073,-227.9259;Inherit;True;MainTexture;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;173;-1919.097,-248.1861;Inherit;False;Property;_ThryEnumPreview;Glow Options;3;0;Create;False;0;0;0;True;1;ThryWideEnum(Glow, 16, No Glow, 14);False;0;0;0;0;0;1;FLOAT;0
WireConnection;32;2;83;0
WireConnection;32;9;97;0
WireConnection;4;1;7;0
WireConnection;97;0;81;0
WireConnection;97;1;160;0
WireConnection;97;2;164;0
WireConnection;23;1;52;0
WireConnection;23;0;52;0
WireConnection;52;1;10;0
WireConnection;52;0;140;0
WireConnection;11;0;12;0
WireConnection;22;0;23;0
WireConnection;16;0;11;1
WireConnection;16;1;11;2
WireConnection;14;0;13;0
WireConnection;15;0;14;0
WireConnection;7;0;15;0
WireConnection;7;1;16;0
WireConnection;96;0;4;0
WireConnection;106;0;133;0
WireConnection;133;0;105;0
WireConnection;133;1;134;0
WireConnection;140;1;141;0
WireConnection;140;0;54;0
WireConnection;54;0;53;0
WireConnection;54;1;55;0
WireConnection;37;0;35;0
WireConnection;37;2;36;0
WireConnection;46;0;44;0
WireConnection;46;2;45;0
WireConnection;49;0;48;0
WireConnection;49;1;67;0
WireConnection;41;0;40;0
WireConnection;41;1;49;0
WireConnection;40;0;39;0
WireConnection;40;1;68;0
WireConnection;50;0;41;0
WireConnection;67;1;46;0
WireConnection;107;0;106;0
WireConnection;120;0;58;0
WireConnection;120;1;121;0
WireConnection;126;0;117;0
WireConnection;126;1;127;0
WireConnection;111;0;122;0
WireConnection;111;1;9;0
WireConnection;122;0;57;0
WireConnection;122;1;124;0
WireConnection;114;1;126;0
WireConnection;114;0;111;0
WireConnection;119;1;120;0
WireConnection;119;0;114;0
WireConnection;82;0;163;0
WireConnection;68;1;37;0
WireConnection;138;0;119;0
WireConnection;138;1;139;0
WireConnection;163;0;138;0
WireConnection;163;1;160;0
WireConnection;160;1;162;0
WireConnection;166;1;185;0
WireConnection;185;0;51;0
WireConnection;185;1;72;0
WireConnection;123;0;166;0
WireConnection;26;0;123;0
ASEEND*/
//CHKSM=1289E29C497E625F1E0EB9CA49DFB5B690F75FDF