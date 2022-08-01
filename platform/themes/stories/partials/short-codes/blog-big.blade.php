<div class="loop-list loop-list-style-1">
    <div class="row">
        @foreach($posts as $post)
            <article class="col-md-6 mb-40 wow fadeInUp animated">
                <div class="post-card-1 border-radius-10 hover-up">
                    <div class="post-thumb thumb-overlay img-hover-slide position-relative" style="background-image: url({{ RvMedia::getImageUrl($post->image, null, false, RvMedia::getDefaultImage()) }})">
                        <a class="img-link" href="{{ $post->url }}"></a>
                        <ul class="social-share">
                            <li><a href="#"><i class="elegant-icon social_share"></i></a></li>
                            <li><a class="fb" href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode($post->url) }}&title={{ $post->description }}" title="{{ __('Share on Facebook') }}" target="_blank"><i class="elegant-icon social_facebook"></i></a></li>
                            <li><a class="tw" href="https://twitter.com/intent/tweet?url={{ urlencode($post->url) }}&text={{ $post->description }}" target="_blank" title="{{ __('Tweet now') }}"><i class="elegant-icon social_twitter"></i></a></li>
                            <li><a class="pt" href="https://www.linkedin.com/shareArticle?mini=true&url={{ urlencode($post->url) }}&summary={{ rawurldecode($post->description) }}" target="_blank" title="{{ __('Share on Linkedin') }}"><i class="elegant-icon social_linkedin"></i></a></li>
                        </ul>
                    </div>
                    <div class="post-content p-30">
                        <div class="entry-meta meta-0 font-small mb-10">
                            @foreach($post->categories as $category)
                                <a href="{{ $category->url }}"><span class="post-cat text-{{ ['warning', 'primary', 'info', 'success'][array_rand(['warning', 'primary', 'info', 'success'])] }}">{{ $category->name }}</span></a>
                            @endforeach
                        </div>
                        <div class="d-flex post-card-content">
                            <h5 class="post-title mb-20 font-weight-900">
                                <a href="{{ $post->url }}">{{ $post->name }}</a>
                            </h5>
                            <div class="post-excerpt mb-25 font-small text-muted">
                                <p>{{ $post->description }}</p>
                            </div>
                            <div class="entry-meta meta-1 float-left font-x-small text-uppercase">
                                <span class="post-on">{{ $post->created_at->format('d M, Y') }}</span>
                                <span class="time-reading has-dot">{{ number_format(strlen($post->content) / 200) }} {{ __('mins read') }}</span>
                                <span class="post-by has-dot">{{ number_format($post->views) }} {{ __('views') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        @endforeach
    </div>
</div>

<div class="pagination-area mb-30 wow fadeInUp animated justify-content-start">
    {!! $posts->withQueryString()->links() !!}
</div>
