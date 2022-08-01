@php Theme::layout('homepage'); @endphp

{!! do_shortcode('[about-banner title="Hello, I’m <span>Steven</span>" subtitle="Welcome to my blog" text_muted="Travel Blogger., Content Writer., Food Guides" image="general/featured.png" newsletter_title="Don\'t miss out on the latest news about Travel tips, Hotels review, Food guide..."]') !!}
{!! do_shortcode('[featured-posts title="Featured posts"]') !!}
{!! do_shortcode('[blog-categories-posts category_id="2"]') !!}
{!! do_shortcode('[categories-with-posts category_id_1="3" category_id_2="4" category_id_3="5"]') !!}
{!! do_shortcode('[featured-categories title="Categories"]') !!}
