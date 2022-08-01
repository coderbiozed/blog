</main>
    <!-- Footer Start-->
    <footer class="pt-50 pb-20 bg-grey">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="sidebar-widget wow fadeInUp animated mb-30">
                        <div class="widget-header-2 position-relative mb-30">
                            <h5 class="mt-5 mb-30">{{ __('About me') }}</h5>
                        </div>
                        <div class="textwidget">
                            <p>
                                {{ theme_option('site_description') }}
                            </p>
                            @if (theme_option('address'))
                                <p><strong class="color-black">{{ __('Address') }}</strong><br>
                                    {{ theme_option('address') }}
                                </p>
                            @endif
                            @if (theme_option('social_1_url'))
                                <p><strong class="color-black">{{ __('Follow me') }}</strong><br>
                            @endif
                            <ul class="header-social-network d-inline-block list-inline color-white mb-20">
                                @for ($i = 1; $i <= 5; $i++)
                                    @if (theme_option('social_' . $i . '_url') && theme_option('social_' . $i . '_name'))
                                        <li class="list-inline-item"><a style="background: {{ theme_option('social_' . $i . '_color') }}" href="{{ theme_option('social_' . $i . '_url') }}" target="_blank" title="{{ theme_option('social_' . $i . '_name') }}"><i class="elegant-icon {{ theme_option('social_' . $i . '_icon') }}"></i></a></li>
                                    @endif
                                @endfor
                            </ul>
                        </div>
                    </div>
                </div>
                {!! dynamic_sidebar('footer_sidebar') !!}
            </div>
            <div class="footer-copy-right pt-30 mt-20 wow fadeInUp animated">
                <p class="float-md-left font-small text-muted">{{ theme_option('copyright') }}</p>
                <p class="float-md-right font-small text-muted">
                    {{ theme_option('designed_by') }}
                </p>
            </div>
        </div>
    </footer>
    <!-- End Footer -->
    <div class="dark-mark"></div>

@if (theme_option('facebook_comment_enabled_in_post', 'yes') == 'yes' || (theme_option('facebook_chat_enabled', 'yes') == 'yes' && theme_option('facebook_page_id')))
    <div id="fb-root"></div>
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                xfbml            : true,
                version          : 'v7.0'
            });
        };

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

    @if (theme_option('facebook_chat_enabled', 'yes') == 'yes' && theme_option('facebook_page_id'))
        <div class="fb-customerchat"
             attribution="install_email"
             page_id="{{ theme_option('facebook_page_id') }}"
             theme_color="{{ theme_option('primary_color', '#ff2b4a') }}">
        </div>
        @endif
        @endif

        {!! Theme::footer() !!}
        </body>
        </html>
