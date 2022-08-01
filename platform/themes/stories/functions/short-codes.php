<?php

use Botble\Ads\Repositories\Interfaces\AdsInterface;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Blog\Repositories\Interfaces\CategoryInterface;

if (is_plugin_active('blog')) {
    add_shortcode('featured-categories', __('Featured categories'), __('Add featured categories'), function ($shortCode) {
        return Theme::partial('short-codes.featured-categories', ['title' => $shortCode->title]);
    });

    shortcode()->setAdminConfig('featured-categories', Theme::partial('short-codes.featured-categories-admin-config'));

    add_shortcode('featured-posts', __('Featured posts'), __('Add featured posts'), function ($shortCode) {
        return Theme::partial('short-codes.featured-posts', ['title' => $shortCode->title]);
    });

    shortcode()->setAdminConfig('featured-posts', Theme::partial('short-codes.featured-posts-admin-config'));

    add_shortcode('blog-categories-posts', __('Blog categories posts'), __('Blog categories posts'),
        function ($shortCode) {
            $category = app(CategoryInterface::class)
                ->findById($shortCode->category_id, ['slugable', 'posts' => function ($query) {
                    $query->latest()->with(['slugable', 'categories', 'categories.slugable'])->limit(4);
                }]);

            if (!$category) {
                return null;
            }

            return Theme::partial('short-codes.blog-categories-posts', compact('category'));
        });

    shortcode()->setAdminConfig('blog-categories-posts', function () {
        $categories = app(CategoryInterface::class)->allBy(['status' => BaseStatusEnum::PUBLISHED]);

        return Theme::partial('short-codes.blog-categories-posts-admin-config', compact('categories'));
    });

    add_shortcode('categories-with-posts', __('Categories with Posts'), __('Categories with Posts'), function ($shortCode) {

        $attributes = $shortCode->toArray();

        $categories = collect([]);

        for ($i = 1; $i <= 3; $i++) {
            if (!Arr::has($attributes, 'category_id_' . $i)) {
                continue;
            }

            $category = app(CategoryInterface::class)->advancedGet([
                'condition' => ['categories.id' => Arr::get($attributes, 'category_id_' . $i)],
                'take' => 1,
                'with'      => [
                    'slugable',
                    'posts' => function ($query) {
                        return $query
                            ->latest()
                            ->with(['slugable'])
                            ->limit(3);
                    },
                ],
            ]);

            if ($category) {
                $categories[] = $category;
            }
        }

        return Theme::partial('short-codes.categories-with-posts', compact('categories'));
    });

    shortcode()->setAdminConfig('categories-with-posts', function () {
        $categories = app(CategoryInterface::class)->allBy(['status' => BaseStatusEnum::PUBLISHED]);

        return Theme::partial('short-codes.categories-with-posts-admin-config', compact('categories'));
    });

    add_shortcode('featured-posts-slider', __('Featured posts slider'), __('Featured posts slider'), function () {
        return Theme::partial('short-codes.featured-posts-slider');
    });

    add_shortcode('featured-posts-slider-full', __('Featured posts slider full'), __('Featured posts slider full'), function () {
        return Theme::partial('short-codes.featured-posts-slider-full');
    });

    add_shortcode('blog-list', __('Blog list'), __('Add blog posts list'), function ($shortCode) {
        $limit = $shortCode->limit ? $shortCode->limit : 12;

        $posts = get_all_posts(true, $limit);

        return Theme::partial('short-codes.blog-list', compact('posts'));
    });

    shortcode()->setAdminConfig('blog-list', Theme::partial('short-codes.blog-list-admin-config'));

    add_shortcode('blog-big', __('Blog big'), __('Add blog posts big'), function ($shortCode) {
        $limit = $shortCode->limit ? $shortCode->limit : 12;

        $posts = get_all_posts(true, $limit);

        return Theme::partial('short-codes.blog-big', compact('posts'));
    });

    shortcode()->setAdminConfig('blog-big', Theme::partial('short-codes.blog-big-admin-config'));

}

if (is_plugin_active('newsletter')) {
    add_shortcode('about-banner', __('About banner'), __('About banner'), function ($shortCode) {
        return Theme::partial('short-codes.about-banner', [
            'title'           => $shortCode->title,
            'subtitle'        => $shortCode->subtitle,
            'textMuted'       => $shortCode->text_muted,
            'newsletterTitle' => $shortCode->newsletter_title,
            'image'           => $shortCode->image,
        ]);
    });

    shortcode()->setAdminConfig('about-banner', Theme::partial('short-codes.about-banner-admin-config'));
}

add_shortcode('google-map', __('Google map'), __('Custom map'), function ($shortCode) {
    return Theme::partial('short-codes.google-map', ['address' => $shortCode->content]);
});

shortcode()->setAdminConfig('google-map', Theme::partial('short-codes.google-map-admin-config'));

add_shortcode('youtube-video', __('Youtube video'), __('Add youtube video'), function ($shortCode) {
    return Theme::partial('short-codes.youtube-video', ['url' => $shortCode->content]);
});

shortcode()->setAdminConfig('youtube-video', Theme::partial('short-codes.youtube-video-admin-config'));

if (is_plugin_active('ads')) {
    add_shortcode('theme-ads', __('Theme ads'), __('Theme ads'), function ($shortCode) {
        $ads = [];
        $attributes = $shortCode->toArray();

        for ($i = 1; $i < 5; $i++) {
            if (isset($attributes['key_' . $i])) {
                $ad = AdsManager::displayAds($attributes['key_' . $i]);
                if ($ad) {
                    $ads[] = $ad;
                }
            }
        }

        $ads = array_filter($ads);

        return Theme::partial('short-codes.theme-ads', compact('ads'));
    });

    shortcode()->setAdminConfig('theme-ads', function () {
        $ads = app(AdsInterface::class)->getModel()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->notExpired()
            ->get();

        return Theme::partial('short-codes.theme-ads-admin-config', compact('ads'));
    });
}
