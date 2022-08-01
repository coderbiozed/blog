@for ($i = 1; $i <= 3; $i++)
    <div class="form-group">
        <label class="control-label">{{ __('Category') }} {{ $i }}</label>
        <select class="form-control"
               data-shortcode-attribute="category_id_{{ $i }}"
                name="category_id_{{ $i }}">
            <option value="">{{ __('-- select --') }}</option>
            @foreach($categories as $category)
                <option value="{{ $category->id }}">{{ $category->name }}</option>
            @endforeach
        </select>
    </div>
@endfor
