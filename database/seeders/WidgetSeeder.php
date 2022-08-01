<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Widget\Models\Widget as WidgetModel;
use Theme;

class WidgetSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        WidgetModel::truncate();

        $data = [
            'en_US' => [
                [
                    'widget_id'  => 'CustomMenuWidget',
                    'sidebar_id' => 'footer_sidebar',
                    'position'   => 0,
                    'data'       => [
                        'id'      => 'CustomMenuWidget',
                        'name'    => 'Quick links',
                        'menu_id' => 'quick-links',
                    ],
                ],
                [
                    'widget_id'  => 'TagsWidget',
                    'sidebar_id' => 'footer_sidebar',
                    'position'   => 1,
                    'data'       => [
                        'id'             => 'TagsWidget',
                        'name'           => 'Tags',
                        'number_display' => 5,
                    ],
                ],
                [
                    'widget_id'  => 'NewsletterWidget',
                    'sidebar_id' => 'footer_sidebar',
                    'position'   => 2,
                    'data'       => [
                        'id'   => 'NewsletterWidget',
                        'name' => 'Newsletter',
                    ],
                ],
                [
                    'widget_id'  => 'AboutWidget',
                    'sidebar_id' => 'primary_sidebar',
                    'position'   => 0,
                    'data'       => [
                        'id'          => 'AboutWidget',
                        'name'        => "Hello, I'm Steven",
                        'description' => "Hi, I’m Steven, a Florida native, who left my career in corporate wealth management six years ago to embark on a summer of soul searching that would change the course of my life forever.",
                        'image'       => 'general/author.jpg',
                    ],
                ],
                [
                    'widget_id'  => 'PopularPostsWidget',
                    'sidebar_id' => 'primary_sidebar',
                    'position'   => 1,
                    'data'       => [
                        'id'             => 'PopularPostsWidget',
                        'name'           => 'Most popular',
                        'number_display' => 5,
                    ],
                ],
                [
                    'widget_id'  => 'GalleriesWidget',
                    'sidebar_id' => 'primary_sidebar',
                    'position'   => 2,
                    'data'       => [
                        'id'             => 'GalleriesWidget',
                        'name'           => 'Galleries',
                        'number_display' => 6,
                    ],
                ],
            ],
            'vi'    => [
                [
                    'widget_id'  => 'CustomMenuWidget',
                    'sidebar_id' => 'footer_sidebar',
                    'position'   => 0,
                    'data'       => [
                        'id'      => 'CustomMenuWidget',
                        'name'    => 'Liên kết nhanh',
                        'menu_id' => 'lien-ket',
                    ],
                ],
                [
                    'widget_id'  => 'TagsWidget',
                    'sidebar_id' => 'footer_sidebar',
                    'position'   => 1,
                    'data'       => [
                        'id'             => 'TagsWidget',
                        'name'           => 'Tags',
                        'number_display' => 5,
                    ],
                ],
                [
                    'widget_id'  => 'NewsletterWidget',
                    'sidebar_id' => 'footer_sidebar',
                    'position'   => 2,
                    'data'       => [
                        'id'   => 'NewsletterWidget',
                        'name' => 'Đăng ký bản tin',
                    ],
                ],
                [
                    'widget_id'  => 'AboutWidget',
                    'sidebar_id' => 'primary_sidebar',
                    'position'   => 0,
                    'data'       => [
                        'id'          => 'AboutWidget',
                        'name'        => 'Xin chào, tôi là Steven',
                        'description' => 'Xin chào, tôi là Steven, người gốc Florida, người đã rời bỏ sự nghiệp quản lý tài sản doanh nghiệp cách đây 6 năm để bắt đầu một mùa hè tìm kiếm tâm hồn sẽ thay đổi cuộc đời tôi mãi mãi.',
                        'image'       => 'general/author.jpg',
                    ],
                ],
                [
                    'widget_id'  => 'PopularPostsWidget',
                    'sidebar_id' => 'primary_sidebar',
                    'position'   => 1,
                    'data'       => [
                        'id'             => 'PopularPostsWidget',
                        'name'           => 'Bài viết nổi bật',
                        'number_display' => 5,
                    ],
                ],
                [
                    'widget_id'  => 'GalleriesWidget',
                    'sidebar_id' => 'primary_sidebar',
                    'position'   => 2,
                    'data'       => [
                        'id'             => 'GalleriesWidget',
                        'name'           => 'Thư viện ảnh',
                        'number_display' => 6,
                    ],
                ],
            ],
        ];

        $theme = Theme::getThemeName();

        foreach ($data as $locale => $widgets) {
            foreach ($widgets as $item) {
                $item['theme'] = $locale == 'en_US' ? $theme : ($theme . '-' . $locale);
                WidgetModel::create($item);
            }
        }
    }
}
