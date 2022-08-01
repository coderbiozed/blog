{!! Theme::partial('header') !!}

<div class="container">
    <div class="archive-header pt-50">
        <h2 class="font-weight-900">{{ SeoHelper::getTitle() }}</h2>
        {!! Theme::partial('breadcrumbs') !!}
        <div class="bt-1 border-color-1 mt-30 mb-50"></div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            {!! Theme::content() !!}
        </div>
        <div class="col-lg-4 primary-sidebar sticky-sidebar">
            {!! AdsManager::display('top-sidebar-ads', ['class' => 'mb-30']) !!}
            {!! dynamic_sidebar('primary_sidebar') !!}
            {!! AdsManager::display('bottom-sidebar-ads', ['class' => 'mt-30 mb-30']) !!}
            <br>
            <br>
        </div>
    </div>
</div>

{!! Theme::partial('footer') !!}
