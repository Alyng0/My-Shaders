// Made with Amplify Shader Editor v1.9.1.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BeatSaber/Alyng/ScreenSpaceTrail"
{
	Properties
	{
		_Color("Color", Color) = (0,0,0,0)
		[Toggle(_CUSTOMCOLORS_ON)] _CustomColors("Custom Colors", Float) = 0
		[Toggle(_USEVERTEXCOLOR_ON)] _UseVertexColor("Use Vertex Color", Float) = 0
		_MainTexture("Main Texture", 2D) = "white" {}
		_Displacement("Displacement", 2D) = "black" {}
		_DisplacementSpeed("Displacement Speed", Vector) = (0,0,0,0)
		_DisplacementStrength("Displacement Strength", Float) = 0
		_ScreenSpaceTexture("ScreenSpace Texture", 2D) = "white" {}
		_ScreenSpaceSpeed("ScreenSpace Speed", Vector) = (0,0,0,0)
		_ScreenspaceIntensity("Screenspace Intensity", Float) = 0
		[Toggle(_SCREENSPACEGRAYSCALE_ON)] _ScreenSpaceGrayscale("ScreenSpace Grayscale", Float) = 0
		_ScreenspaceDistortion("ScreenspaceDistortion", 2D) = "black" {}
		_ScreenDisplacementSpeed("ScreenDisplacement Speed", Vector) = (0,0,0,0)
		_ScreenDisplacementStrength("ScreenDisplacement Strength", Float) = 0
		_Glow("Glow", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Transparent+0" "IsEmissive" = "true"  "PreviewType"="Plane" }
		Cull Off
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha , One One
		BlendOp Add
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _SCREENSPACEGRAYSCALE_ON
		#pragma shader_feature_local _USEVERTEXCOLOR_ON
		#pragma shader_feature_local _CUSTOMCOLORS_ON
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _MainTexture;
		uniform float _DisplacementStrength;
		uniform sampler2D _Displacement;
		uniform float4 _DisplacementSpeed;
		uniform sampler2D _ScreenSpaceTexture;
		uniform float _ScreenDisplacementStrength;
		uniform sampler2D _ScreenspaceDistortion;
		uniform float4 _ScreenDisplacementSpeed;
		uniform float4 _ScreenSpaceSpeed;
		uniform float _ScreenspaceIntensity;
		uniform float4 _Color;
		uniform float _Glow;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 panner11 = ( 1.0 * _Time.y * _DisplacementSpeed.xy + i.uv_texcoord);
			float4 Distortions15 = ( _DisplacementStrength * tex2D( _Displacement, panner11 ) );
			float grayscale20 = (tex2D( _MainTexture, ( Distortions15 + float4( i.uv_texcoord, 0.0 , 0.0 ) ).rg ).rgb.r + tex2D( _MainTexture, ( Distortions15 + float4( i.uv_texcoord, 0.0 , 0.0 ) ).rg ).rgb.g + tex2D( _MainTexture, ( Distortions15 + float4( i.uv_texcoord, 0.0 , 0.0 ) ).rg ).rgb.b) / 3;
			float MainTexture23 = grayscale20;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 panner27 = ( 1.0 * _Time.y * _ScreenDisplacementSpeed.xy + ase_screenPosNorm.xy);
			float4 ScreenspaceDistortion30 = ( _ScreenDisplacementStrength * tex2D( _ScreenspaceDistortion, panner27 ) );
			float2 panner56 = ( 1.0 * _Time.y * _ScreenSpaceSpeed.xy + ase_screenPosNorm.xy);
			float4 temp_output_50_0 = ( tex2D( _ScreenSpaceTexture, ( ScreenspaceDistortion30 + float4( panner56, 0.0 , 0.0 ) ).rg ) * _ScreenspaceIntensity );
			float grayscale34 = (temp_output_50_0.rgb.r + temp_output_50_0.rgb.g + temp_output_50_0.rgb.b) / 3;
			float4 temp_cast_13 = (grayscale34).xxxx;
			#ifdef _SCREENSPACEGRAYSCALE_ON
				float4 staticSwitch39 = temp_cast_13;
			#else
				float4 staticSwitch39 = temp_output_50_0;
			#endif
			float4 ScreenSpace36 = staticSwitch39;
			#ifdef _CUSTOMCOLORS_ON
				float4 staticSwitch5 = _Color;
			#else
				float4 staticSwitch5 = _Color;
			#endif
			float4 temp_cast_14 = (2.2).xxxx;
			#ifdef _USEVERTEXCOLOR_ON
				float4 staticSwitch6 = pow( i.vertexColor , temp_cast_14 );
			#else
				float4 staticSwitch6 = staticSwitch5;
			#endif
			float4 Colors7 = staticSwitch6;
			o.Emission = ( MainTexture23 * ScreenSpace36 * Colors7 ).rgb;
			o.Alpha = ( _Glow * MainTexture23 * ScreenSpace36 ).r;
		}

		ENDCG
	}
	Fallback "False"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19107
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;BeatSaber/Alyng/ScreenSpaceTrail;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;2;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;TransparentCutout;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;False;;4;1;False;;1;False;;1;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;False;0;-1;-1;-1;1;PreviewType=Plane;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.VertexColorNode;2;293.9823,160.3737;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;3;494.9817,170.3737;Inherit;True;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4;294.9823,321.3736;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;2.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;5;535.9815,-37.62638;Inherit;False;Property;_CustomColors;Custom Colors;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;7;1155.981,191.3738;Inherit;False;Colors;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;406.6628,1570.625;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;9;406.6628,1681.113;Inherit;False;Property;_DisplacementSpeed;Displacement Speed;6;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,-0.14,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;11;662.6631,1602.626;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;12;872.1752,1489.113;Inherit;False;Property;_DisplacementStrength;Displacement Strength;7;0;Create;True;0;0;0;False;0;False;0;0.12;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;1211.663,1561.626;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;1378.171,1558.235;Inherit;False;Distortions;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;1161.28,513.0976;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;30;1354.177,497.7109;Inherit;False;ScreenspaceDistortion;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;486.6628,1330.625;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;17;534.6628,1218.625;Inherit;False;15;Distortions;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;18;726.663,1298.625;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;1446.661,1186.626;Inherit;False;MainTexture;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;19;838.6631,1202.626;Inherit;True;Property;_MainTexture;Main Texture;4;0;Create;True;0;0;0;True;0;False;-1;None;3b31c892105074b4e9c8f390b54c134a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;33;467.7856,930.8018;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCGrayscale;20;1184.937,1195.468;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-405.4491,222.604;Inherit;False;Property;_Glow;Glow;15;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-469.697,296.8761;Inherit;False;23;MainTexture;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;43;-464.2382,375.031;Inherit;False;36;ScreenSpace;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-224.2086,255.743;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;37;579.7857,834.8016;Inherit;True;Property;_ScreenSpaceTexture;ScreenSpace Texture;8;0;Create;True;0;0;0;True;0;False;-1;None;1fc0fad2e9351bc4d934046a39f07dbc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1;270.6505,-39.70521;Inherit;False;Property;_Color;Color;1;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;6;838.9814,190.3738;Inherit;False;Property;_UseVertexColor;Use Vertex Color;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;32;161.7856,875.8015;Inherit;False;30;ScreenspaceDistortion;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;28;821.7917,440.5852;Inherit;False;Property;_ScreenDisplacementStrength;ScreenDisplacement Strength;14;0;Create;True;0;0;0;False;0;False;0;0.16;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;45;-1073.606,-9.610634;Inherit;False;23;MainTexture;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;47;-1072.568,135.5115;Inherit;False;7;Colors;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-748.9187,23.04135;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;36;1603.578,816.2475;Inherit;False;ScreenSpace;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCGrayscale;34;934.4951,779.3051;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;906.9236,878.7668;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;51;603.9236,1032.906;Inherit;False;Property;_ScreenspaceIntensity;Screenspace Intensity;10;0;Create;True;0;0;0;False;0;False;0;1.63;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;39;1213.311,845.8579;Inherit;False;Property;_ScreenSpaceGrayscale;ScreenSpace Grayscale;11;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;49;310.8488,472.6587;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;54;-1079.791,60.21564;Inherit;False;36;ScreenSpace;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;26;269.2794,632.5848;Inherit;False;Property;_ScreenDisplacementSpeed;ScreenDisplacement Speed;13;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,-0.3,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;27;612.2798,554.0977;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;56;265.54,1012.096;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;48;-43.74699,960.0999;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;55;-36.84699,1137.609;Inherit;False;Property;_ScreenSpaceSpeed;ScreenSpace Speed;9;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0.31,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;854.6631,1570.625;Inherit;True;Property;_Displacement;Displacement;5;0;Create;True;0;0;0;True;0;False;-1;None;c99e57617f74fe34190b11e253da5584;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;24;806.7526,525.1435;Inherit;True;Property;_ScreenspaceDistortion;ScreenspaceDistortion;12;0;Create;True;0;0;0;False;0;False;-1;None;823ae7934c3714745a0968d273646e4f;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;0;2;44;0
WireConnection;0;9;42;0
WireConnection;3;0;2;0
WireConnection;3;1;4;0
WireConnection;5;1;1;0
WireConnection;5;0;1;0
WireConnection;7;0;6;0
WireConnection;11;0;10;0
WireConnection;11;2;9;0
WireConnection;14;0;12;0
WireConnection;14;1;13;0
WireConnection;15;0;14;0
WireConnection;29;0;28;0
WireConnection;29;1;24;0
WireConnection;30;0;29;0
WireConnection;18;0;17;0
WireConnection;18;1;16;0
WireConnection;23;0;20;0
WireConnection;19;1;18;0
WireConnection;33;0;32;0
WireConnection;33;1;56;0
WireConnection;20;0;19;0
WireConnection;42;0;41;0
WireConnection;42;1;40;0
WireConnection;42;2;43;0
WireConnection;37;1;33;0
WireConnection;6;1;5;0
WireConnection;6;0;3;0
WireConnection;44;0;45;0
WireConnection;44;1;54;0
WireConnection;44;2;47;0
WireConnection;36;0;39;0
WireConnection;34;0;50;0
WireConnection;50;0;37;0
WireConnection;50;1;51;0
WireConnection;39;1;50;0
WireConnection;39;0;34;0
WireConnection;27;0;49;0
WireConnection;27;2;26;0
WireConnection;56;0;48;0
WireConnection;56;2;55;0
WireConnection;13;1;11;0
WireConnection;24;1;27;0
ASEEND*/
//CHKSM=EC7E5199F3123758B3C50D70EA5A5710AAE11F99