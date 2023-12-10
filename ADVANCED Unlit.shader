// Made with Amplify Shader Editor v1.9.1.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BeatSaber/Alyng/ADVANCED Unlit"
{
	Properties
	{
		[HideInInspector]m_start_ShaderOptions("Shader Options", Float) = 0
		[ThryWideEnum(Off, 0, Front, 1, Back, 2)]_ThryEnumPreview("Cull", Float) = 0
		[HideInInspector]m_end_ShaderOptions("Shader Options", Float) = 0
		[HideInInspector]m_start_MainSettings("Main Settings", Float) = 0
		_Color("Color", Color) = (1,0,0,1)
		[Toggle(_CUSTOMCOLORS_ON)] _CustomColors("Custom Colors", Float) = 0
		[BigTexture]_BigTexturePreview("Texture", 2D) = "white" {}
		_Glow1("Glow", Range( 0 , 1)) = 0
		[HideInInspector]m_end_MainSettings("Main Settings", Float) = 0
		[HideInInspector]m_start_Gradients("Gradients", Float) = 0
		[Toggle(_GRADIENT_ON)] _Gradient("Gradient", Float) = 0
		[Toggle(_COLORGRADIENT1_ON)] _ColorGradient1("Color Gradient", Float) = 0
		[Gradient]_GradientPreview1("Gradient Preview", 2D) = "white" {}
		[Toggle]_GradientRotate1("Gradient Rotate", Float) = 0
		_GradientSpeed1("Gradient Speed", Float) = 1
		_GradientSize1("Gradient Size", Float) = 1
		[HideInInspector]m_end_Gradients("Gradients", Float) = 0
		[HideInInspector]m_start_Fresnel("Fresnel", Float) = 0
		[Toggle(_FRESNEL_ON)] _Fresnel("Fresnel", Float) = 0
		_FresnelBias("Fresnel Bias", Float) = 1
		_FresnelPower("Fresnel Power", Float) = 1
		_FresnelScale("Fresnel Scale", Float) = 1
		[HideInInspector]m_end_Fresnel("Fresnel", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+2000" "IsEmissive" = "true"  }
		Cull [_ThryEnumPreview]
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _GRADIENT_ON
		#pragma shader_feature_local _CUSTOMCOLORS_ON
		#pragma shader_feature_local _COLORGRADIENT1_ON
		#pragma shader_feature_local _FRESNEL_ON
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
		};

		uniform float _ThryEnumPreview;
		uniform sampler2D _BigTexturePreview;
		uniform float4 _Color;
		uniform sampler2D _GradientPreview1;
		uniform float _GradientSpeed1;
		uniform float _GradientRotate1;
		uniform float _GradientSize1;
		uniform float _FresnelBias;
		uniform float _FresnelScale;
		uniform float _FresnelPower;
		uniform float _Glow1;


		float3 RGBToHSV(float3 c)
		{
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
			float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
			float d = q.x - min( q.w, q.y );
			float e = 1.0e-10;
			return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 MainTexture518 = tex2D( _BigTexturePreview, i.uv_texcoord );
			#ifdef _CUSTOMCOLORS_ON
				float4 staticSwitch542 = _Color;
			#else
				float4 staticSwitch542 = _Color;
			#endif
			float4 Color609 = staticSwitch542;
			float mulTime558 = _Time.y * _GradientSpeed1;
			float2 temp_cast_0 = (_GradientSize1).xx;
			float2 uv_TexCoord555 = i.uv_texcoord * temp_cast_0;
			float2 temp_cast_1 = (( fmod( mulTime558 , 7200.0 ) + (( _GradientRotate1 )?( uv_TexCoord555.y ):( uv_TexCoord555.x )) )).xx;
			float4 GradientOut564 = tex2D( _GradientPreview1, temp_cast_1 );
			float3 hsvTorgb613 = RGBToHSV( GradientOut564.rgb );
			float GlowGradient592 = hsvTorgb613.z;
			#ifdef _COLORGRADIENT1_ON
				float4 staticSwitch574 = ( ( GlowGradient592 * MainTexture518 ) * Color609 );
			#else
				float4 staticSwitch574 = ( GradientOut564 * MainTexture518 );
			#endif
			#ifdef _GRADIENT_ON
				float4 staticSwitch575 = staticSwitch574;
			#else
				float4 staticSwitch575 = ( MainTexture518 * Color609 );
			#endif
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV496 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode496 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV496, _FresnelPower ) );
			#ifdef _FRESNEL_ON
				float staticSwitch596 = fresnelNode496;
			#else
				float staticSwitch596 = 1.0;
			#endif
			float4 Final576 = ( staticSwitch575 * staticSwitch596 );
			o.Emission = Final576.rgb;
			float Fresnel614 = fresnelNode496;
			o.Alpha = ( _Glow1 * MainTexture518 * GlowGradient592 * Fresnel614 ).r;
		}

		ENDCG
	}
	CustomEditor "Thry.ShaderEditor"
}
/*ASEBEGIN
Version=19107
Node;AmplifyShaderEditor.RangedFloatNode;499;-2427.839,-1343.039;Inherit;False;Property;m_end_Gradients;Gradients;18;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-2426.681,-1429.011;Inherit;False;Property;m_start_Gradients;Gradients;11;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;502;-2576.132,-1520.146;Inherit;False;Property;_shader_is_using_thry_editor;shader_is_using_thry_editor;1;1;[HideInInspector];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;503;-2294.681,-1345.01;Inherit;False;Property;m_end_Fresnel;Fresnel;24;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;507;-2297.681,-1429.011;Inherit;False;Property;m_start_Fresnel;Fresnel;19;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;562;-910.2919,-1121.043;Inherit;False;330;259;Requires Thry Material Editor;1;563;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;555;-1662.292,-977.0432;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;556;-1854.292,-961.0435;Inherit;False;Property;_GradientSize1;Gradient Size;17;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;557;-1726.292,-1249.043;Inherit;True;Property;_GradientSpeed1;Gradient Speed;16;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;558;-1486.292,-1217.044;Inherit;True;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;559;-1406.292,-961.0435;Inherit;False;Property;_GradientRotate1;Gradient Rotate;15;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FmodOpNode;560;-1262.292,-1105.043;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;7200;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;561;-1134.292,-1073.043;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;564;-510.2923,-1105.043;Inherit;True;GradientOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;592;-211.6476,-819.6378;Inherit;True;GlowGradient;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;504;-2215.945,97.10075;Inherit;False;0;-1;2;3;2;OBJECT;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;518;-1638.745,88.67434;Inherit;False;MainTexture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;566;-1051.665,154.6389;Inherit;False;518;MainTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;567;-843.6647,138.6389;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;568;-1067.665,58.6391;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;569;-1307.665,122.6389;Inherit;False;518;MainTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;570;-1435.665,-85.3605;Inherit;False;518;MainTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;572;-1163.665,-165.3602;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;573;-1003.665,-117.3605;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;571;-1435.665,-181.3602;Inherit;False;592;GlowGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;493;-835.0521,511.553;Inherit;False;Property;_FresnelPower;Fresnel Power;22;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;494;-822.9449,431.4171;Inherit;False;Property;_FresnelScale;Fresnel Scale;23;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;495;-810.4491,356.7522;Inherit;False;Property;_FresnelBias;Fresnel Bias;21;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;496;-590.4261,373.742;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;574;-867.6647,24.63948;Inherit;False;Property;_ColorGradient1;Color Gradient;13;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;563;-878.2919,-1073.043;Inherit;True;Property;_GradientPreview1;Gradient Preview;14;0;Create;True;0;0;0;False;1;Gradient;False;-1;ce211bfd4b0a09c488b675585192016e;9fc0b4f3f302c7c40943b5ea3f5c3cbf;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;575;-508.6647,78.64019;Inherit;False;Property;_Gradient;Gradient;12;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;596;-291.897,243.3242;Inherit;False;Property;_Fresnel;Fresnel;20;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;593;-235.2324,73.80566;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;597;-497.897,256.3242;Inherit;False;Constant;_Float0;Float 0;22;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;576;-78.65173,50.4717;Inherit;False;Final;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;598;-1303.897,48.32416;Inherit;False;564;GradientOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;505;-1951.399,74.26096;Inherit;True;Property;_BigTexturePreview;Texture;8;0;Create;False;0;0;0;True;1;BigTexture;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;594;446.9782,-128.0325;Inherit;False;576;Final;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;498;-2576,-1344;Inherit;False;Property;m_end_MainSettings;Main Settings;10;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;500;-2585.294,-1440.981;Inherit;False;Property;m_start_MainSettings;Main Settings;5;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;601;-2755.295,-1354.957;Inherit;False;Property;m_end_ShaderOptions;Shader Options;4;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;602;-2759.295,-1436.957;Inherit;False;Property;m_start_ShaderOptions;Shader Options;2;1;[HideInInspector];Fetch;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;603;641.5584,-101.4807;Float;False;True;-1;2;Thry.ShaderEditor;0;0;Unlit;BeatSaber/Alyng/ADVANCED Unlit;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;2000;True;Custom;Opaque;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;True;_ThryEnumPreview;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;577;397.381,173.4536;Inherit;True;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;600;-2566.295,-1258.957;Inherit;False;Property;_ThryEnumPreview;Cull;3;0;Create;False;0;0;0;True;1;ThryWideEnum(Off, 0, Front, 1, Back, 2);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;542;-1329.566,-1457.182;Inherit;False;Property;_CustomColors;Custom Colors;7;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;517;-1879.438,-1523.305;Float;False;Property;_Color;Color;6;0;Create;True;0;0;0;False;0;False;1,0,0,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;578;118.0069,117.3665;Inherit;False;Property;_Glow1;Glow;9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;609;-1053.217,-1452.099;Inherit;False;Color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;599;-1204.16,-49.88367;Inherit;False;609;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;565;-1051.665,250.6383;Inherit;False;609;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;580;162.293,188.703;Inherit;False;518;MainTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;610;162.8131,286.5997;Inherit;False;592;GlowGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;613;-490.4941,-831.1907;Inherit;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;588;-752.1287,-814.7733;Inherit;False;564;GradientOut;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;614;-194.16,381.9089;Inherit;False;Fresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;615;188.84,375.9089;Inherit;False;614;Fresnel;1;0;OBJECT;;False;1;FLOAT;0
WireConnection;555;0;556;0
WireConnection;558;0;557;0
WireConnection;559;0;555;1
WireConnection;559;1;555;2
WireConnection;560;0;558;0
WireConnection;561;0;560;0
WireConnection;561;1;559;0
WireConnection;564;0;563;0
WireConnection;592;0;613;3
WireConnection;518;0;505;0
WireConnection;567;0;566;0
WireConnection;567;1;565;0
WireConnection;568;0;598;0
WireConnection;568;1;569;0
WireConnection;572;0;571;0
WireConnection;572;1;570;0
WireConnection;573;0;572;0
WireConnection;573;1;599;0
WireConnection;496;1;495;0
WireConnection;496;2;494;0
WireConnection;496;3;493;0
WireConnection;574;1;568;0
WireConnection;574;0;573;0
WireConnection;563;1;561;0
WireConnection;575;1;567;0
WireConnection;575;0;574;0
WireConnection;596;1;597;0
WireConnection;596;0;496;0
WireConnection;593;0;575;0
WireConnection;593;1;596;0
WireConnection;576;0;593;0
WireConnection;505;1;504;0
WireConnection;603;2;594;0
WireConnection;603;9;577;0
WireConnection;577;0;578;0
WireConnection;577;1;580;0
WireConnection;577;2;610;0
WireConnection;577;3;615;0
WireConnection;542;1;517;0
WireConnection;542;0;517;0
WireConnection;609;0;542;0
WireConnection;613;0;588;0
WireConnection;614;0;496;0
ASEEND*/
//CHKSM=62B68AB7E38BF5303A7D9F27360719BB5BDA3160
