Shader ".poiyomi/Toon/Stencil/Invis"
{
    properties
    {
        [IntRange] _StencilRef ("Stencil Reference Value", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompareFunction ("Stencil Compare Function", Float) = 0

		[HideInInspector] footer_github("linkButton(Github,https://github.com/poiyomi/PoiyomiToonShader)", Float) = 0
		[HideInInspector] footer_discord("linkButton(Discord,https://discord.gg/Ays52PY)", Float) = 0
		[HideInInspector] footer_donate("linkButton(Donate,https://www.paypal.me/poiyomi)", Float) = 0
		[HideInInspector] footer_patreon("linkButton(Patreon,https://www.patreon.com/poiyomi)", Float) = 0
    }
	CustomEditor "PoiToon"

    SubShader
    {
        
        Tags { "RenderType" = "Opaque" "Queue" = "AlphaTest-1" }
        ColorMask 0
        ZWrite off
        Stencil
        {
            Ref [_StencilRef]
            Comp [_StencilCompareFunction]
            Pass [_StencilOp]
        }
        
        CGINCLUDE
        struct appdata
        {
            float4 vertex: POSITION;
        };
        struct v2f
        {
            float4 pos: SV_POSITION;
        };
        v2f vert(appdata v)
        {
            v2f o;
            o.pos = UnityObjectToClipPos(v.vertex);
            return o;
        }
        half4 frag(v2f i): COLOR
        {
            return half4(1, 1, 0, 1);
        }
        ENDCG
        
        Pass
        {
            Cull Back
            ZTest Less
            
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            ENDCG
            
        }
    }
}