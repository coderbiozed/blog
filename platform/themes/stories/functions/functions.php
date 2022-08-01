<?php

use Botble\ACL\Models\User;
use Botble\Base\Models\MetaBox as MetaBoxModel;
use Botble\Blog\Models\Category;

register_page_template([
    'full-width'    => __('Full width'),
    'homepage'      => __('Homepage'),
    'right-sidebar' => __('Right sidebar'),
]);

register_sidebar([
    'id'          => 'footer_sidebar',
    'name'        => __('Footer sidebar'),
    'description' => __('Sidebar in the footer of page'),
]);

add_action('init', function () {
    config([
        'filesystems.disks.public.root' => public_path('storage'),
        'filesystems.disks.public.url'  => str_replace('/index.php', '', url('storage')),
    ]);
}, 124);

if (is_plugin_active('blog')) {
    add_action(BASE_ACTION_META_BOXES, function ($context, $object) {
        if (get_class($object) == Category::class && $context == 'side') {
            MetaBox::addMetaBox('additional_blog_category_fields', __('Addition Information'), function () {
                $image = null;
                $args = func_get_args();
                if (!empty($args[0])) {
                    $image = MetaBox::getMetaData($args[0], 'image', true);
                }

                return Theme::partial('blog-category-fields', compact('image'));
            }, get_class($object), $context);
        }
    }, 24, 2);

    add_action(BASE_ACTION_AFTER_CREATE_CONTENT, function ($type, $request, $object) {
        if (get_class($object) == Category::class) {
            MetaBox::saveMetaBoxData($object, 'image', $request->input('image'));
        }
    }, 230, 3);

    add_action(BASE_ACTION_AFTER_UPDATE_CONTENT, function ($type, $request, $object) {
        if (get_class($object) == Category::class) {
            MetaBox::saveMetaBoxData($object, 'image', $request->input('image'));
        }
    }, 231, 3);
}

if (is_plugin_active('ads')) {
    AdsManager::registerLocation('panel-ads', __('Panel Ads'))
        ->registerLocation('top-sidebar-ads', __('Top Sidebar Ads'))
        ->registerLocation('bottom-sidebar-ads', __('Bottom Sidebar Ads'));
}

Form::component('themeIcon', Theme::getThemeNamespace() . '::partials.icons-field', [
    'name',
    'value'      => null,
    'attributes' => [],
]);

app()->booted(function () {
    if (is_plugin_active('blog')) {
        Category::resolveRelationUsing('image', function ($model) {
            return $model->morphOne(MetaBoxModel::class, 'reference')->where('meta_key', 'image');
        });
    }
});

add_filter(BASE_FILTER_BEFORE_RENDER_FORM, function ($form, $data) {
    if (get_class($data) == User::class && $form->getFormOption('id') == 'profile-form') {
        $form
            ->add('bio', 'textarea', [
                'label'      => __('Bio'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'placeholder' => __('Write something about yourself...'),
                ],
                'wrapper'   => [
                    'class' => $form->getFormHelper()->getConfig('defaults.wrapper_class') . ' col-md-12',
                ],
                'value' => MetaBox::getMetaData($data, 'bio', true),
            ]);
    }
}, 127, 2);

add_action(USER_ACTION_AFTER_UPDATE_PROFILE, function ($screen, $request, $user) {
    if ($screen == USER_MODULE_SCREEN_NAME) {
        MetaBox::saveMetaBoxData($user, 'bio', $request->input('bio'));
    }
} , 127, 3);
