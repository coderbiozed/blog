<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Setting\Models\Setting as SettingModel;
use Theme;

class ThemeOptionSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->uploadFiles('general');

        $theme = Theme::getThemeName();

        SettingModel::where('key', 'LIKE', 'theme-' . $theme . '-%')->delete();

        SettingModel::insertOrIgnore([
            [
                'key'   => 'show_admin_bar',
                'value' => '1',
            ],
            [
                'key'   => 'theme',
                'value' => $theme,
            ],
        ]);

        $data = [
            'en_US' => [
                [
                    'key'   => 'site_title',
                    'value' => 'Stories - Laravel Personal Blog Script',
                ],
                [
                    'key'   => 'copyright',
                    'value' => '©' . now()->format('Y') . ' Stories - Laravel Personal Blog Script',
                ],
                [
                    'key'   => 'designed_by',
                    'value' => 'Designed by AliThemes | All rights reserved.',
                ],
                [
                    'key'   => 'favicon',
                    'value' => 'general/favicon.png',
                ],
                [
                    'key'   => 'site_description',
                    'value' => 'Start writing, no matter what. The water does not flow until the faucet is turned on.',
                ],
                [
                    'key'   => 'address',
                    'value' => '123 Main Street New York, NY 100012',
                ],
                [
                    'key'   => 'facebook',
                    'value' => 'https://facebook.com',
                ],
                [
                    'key'   => 'twitter',
                    'value' => 'https://twitter.com',
                ],
                [
                    'key'   => 'youtube',
                    'value' => 'https://youtube.com',
                ],
                [
                    'key'   => 'cookie_consent_message',
                    'value' => 'Your experience on this site will be improved by allowing cookies ',
                ],
                [
                    'key'   => 'cookie_consent_learn_more_url',
                    'value' => url('cookie-policy'),
                ],
                [
                    'key'   => 'cookie_consent_learn_more_text',
                    'value' => 'Cookie Policy',
                ],
                [
                    'key'   => 'homepage_id',
                    'value' => '1',
                ],
                [
                    'key'   => 'blog_page_id',
                    'value' => '4',
                ],
                [
                    'key'   => 'logo',
                    'value' => 'general/logo.png',
                ],
                [
                    'key'   => 'social_1_name',
                    'value' => 'Facebook',
                ],
                [
                    'key'   => 'social_1_icon',
                    'value' => 'social_facebook',
                ],
                [
                    'key'   => 'social_1_url',
                    'value' => 'https://facebook.com',
                ],
                [
                    'key'   => 'social_1_color',
                    'value' => '#3b5999',
                ],
                [
                    'key'   => 'social_2_name',
                    'value' => 'Twitter',
                ],
                [
                    'key'   => 'social_2_icon',
                    'value' => 'social_twitter',
                ],
                [
                    'key'   => 'social_2_url',
                    'value' => 'https://twitter.com',
                ],
                [
                    'key'   => 'social_2_color',
                    'value' => '#55ACF9',
                ],
                [
                    'key'   => 'social_3_name',
                    'value' => 'Linkedin',
                ],
                [
                    'key'   => 'social_3_icon',
                    'value' => 'social_linkedin',
                ],
                [
                    'key'   => 'social_3_url',
                    'value' => 'https://linkedin.com',
                ],
                [
                    'key'   => 'social_3_color',
                    'value' => '#0a66c2',
                ],
                [
                    'key'   => 'action_button_text',
                    'value' => 'Buy Now',
                ],
                [
                    'key'   => 'action_button_url',
                    'value' => 'https://botble.com/go/stories',
                ],
            ],

            'vi' => [
                [
                    'key'   => 'site_title',
                    'value' => 'Stories - Laravel Personal Blog Script',
                ],
                [
                    'key'   => 'copyright',
                    'value' => '©' . now()->format('Y') . ' Stories - Laravel Personal Blog Script',
                ],
                [
                    'key'   => 'designed_by',
                    'value' => 'Designed by AliThemes | All rights reserved.',
                ],
                [
                    'key'   => 'favicon',
                    'value' => 'general/favicon.png',
                ],
                [
                    'key'   => 'site_description',
                    'value' => 'Bắt đầu viết, không có vấn đề gì. Nước không chảy cho đến khi vòi được bật.',
                ],
                [
                    'key'   => 'address',
                    'value' => '123 Main Street New York, NY 10001',
                ],
                [
                    'key'   => 'facebook',
                    'value' => 'https://facebook.com',
                ],
                [
                    'key'   => 'twitter',
                    'value' => 'https://twitter.com',
                ],
                [
                    'key'   => 'youtube',
                    'value' => 'https://youtube.com',
                ],
                [
                    'key'   => 'cookie_consent_message',
                    'value' => 'Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',
                ],
                [
                    'key'   => 'cookie_consent_learn_more_url',
                    'value' => url('cookie-policy'),
                ],
                [
                    'key'   => 'cookie_consent_learn_more_text',
                    'value' => 'Cookie Policy',
                ],
                [
                    'key'   => 'homepage_id',
                    'value' => '9',
                ],
                [
                    'key'   => 'blog_page_id',
                    'value' => '12',
                ],
                [
                    'key'   => 'logo',
                    'value' => 'general/logo.png',
                ],
                [
                    'key'   => 'social_1_name',
                    'value' => 'Facebook',
                ],
                [
                    'key'   => 'social_1_icon',
                    'value' => 'social_facebook',
                ],
                [
                    'key'   => 'social_1_url',
                    'value' => 'https://facebook.com',
                ],
                [
                    'key'   => 'social_1_color',
                    'value' => '#3b5999',
                ],
                [
                    'key'   => 'social_2_name',
                    'value' => 'Twitter',
                ],
                [
                    'key'   => 'social_2_icon',
                    'value' => 'social_twitter',
                ],
                [
                    'key'   => 'social_2_url',
                    'value' => 'https://twitter.com',
                ],
                [
                    'key'   => 'social_2_color',
                    'value' => '#55ACF9',
                ],
                [
                    'key'   => 'social_3_name',
                    'value' => 'Linkedin',
                ],
                [
                    'key'   => 'social_3_icon',
                    'value' => 'social_linkedin',
                ],
                [
                    'key'   => 'social_3_url',
                    'value' => 'https://linkedin.com',
                ],
                [
                    'key'   => 'social_3_color',
                    'value' => '#0a66c2',
                ],
                [
                    'key'   => 'action_button_text',
                    'value' => 'Mua ngay',
                ],
                [
                    'key'   => 'action_button_url',
                    'value' => 'https://botble.com/go/stories',
                ],
                [
                    'key'   => 'primary_font',
                    'value' => 'Roboto',
                ],
            ],
        ];

        foreach ($data as $locale => $options) {
            foreach ($options as $item) {
                $item['key'] = 'theme-' . $theme . '-' . ($locale != 'en_US' ? $locale . '-' : '') . $item['key'];

                SettingModel::create($item);
            }
        }
    }
}
