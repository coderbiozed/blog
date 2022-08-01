<div class="site-bottom pt-50 pb-50">
    <div class="container">
        <div class="sidebar-widget widget-latest-posts mb-30 mt-20 wow fadeInUp animated">
            <div class="widget-header-2 position-relative mb-30">
                <h5 class="mt-5 mb-30">{!! clean($title) !!}</h5>
            </div>
            <div class="carausel-3-columns">
                @foreach (get_featured_categories(10, ['slugable', 'image']) as $category)
                    <div class="carausel-3-columns-item d-flex bg-grey has-border p-25 hover-up-2 transition-normal border-radius-5">
                        <div class="post-thumb post-thumb-64 d-flex mr-15 border-radius-5 img-hover-scale overflow-hidden">
                            <a class="color-white" href="{{ $category->url }}">
                                @if (count($category->image->meta_value) > 0)
                                <img src="{{ RvMedia::getImageUrl($category->image->meta_value[0], 'thumb', false, RvMedia::getDefaultImage()) }}" alt="{{ $category->name }}">
                                @endif
                            </a>
                        </div>
                        <div class="post-content media-body">
                            <h6> <a href="{{ $category->url }}">{{ $category->name }}</a> </h6>
                            <p class="text-muted font-small">{{ Str::limit($category->description, 65) }}</p>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
