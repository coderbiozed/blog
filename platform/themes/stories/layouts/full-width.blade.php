{!! Theme::partial('header') !!}

<div class="archive-header pt-50">
    <h2 class="font-weight-900">{{ SeoHelper::getTitle() }}</h2>
    {!! Theme::partial('breadcrumbs') !!}
    <div class="bt-1 border-color-1 mt-30 mb-50"></div>
</div>

{!! Theme::content() !!}

{!! Theme::partial('footer') !!}
