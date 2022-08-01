<div class="featured-1">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 align-self-center">
                @if (isset($textMuted) && $textMuted)
                    <p class="text-muted"><span class="typewrite d-inline" data-period="2000" data-type='[ @foreach (explode(',', $textMuted) as $text)
                        "{{ $text }}" @if (!$loop->last) , @endif
                    @endforeach ]'></span></p>
                @endif
                @if (isset($title) && $title)
                    <h2>{!! clean($title) !!}</h2>
                @endif
                @if (isset($subtitle) && $subtitle)
                    <h3 class="mb-20">{!! clean($subtitle) !!}</h3>
                @endif
                @if (isset($newsletterTitle) && $newsletterTitle)
                    <h5 class="text-muted">{!! clean($newsletterTitle) !!}</h5>
                @endif
                <form class="form-subcriber mt-30 newsletter-form" action="{{ route('public.newsletter.subscribe') }}" method="post">
                    @csrf
                    @if (setting('enable_captcha') && is_plugin_active('captcha'))
                        <div class="form-group">
                            {!! Captcha::display() !!}
                        </div>
                    @endif
                    <div class="input-group d-flex">
                        <input type="email" name="email" class="form-control bg-white font-small" placeholder="{{ __('Enter your email') }}">
                        <button class="btn bg-primary text-white" type="submit">{{ __('Subscribe') }}</button>
                    </div>
                </form>
            </div>
            @if (isset($image) && $image)
                <div class="col-lg-6 text-right d-none d-lg-block">
                    <img src="{{ RvMedia::getImageUrl($image) }}" alt="{{ __('Image') }}">
                </div>
            @endif
        </div>
    </div>
</div>
