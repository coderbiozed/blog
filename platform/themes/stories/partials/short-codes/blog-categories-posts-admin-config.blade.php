<div class="form-group">
    <label class="control-label">{{ __('Select a category') }}</label>
    <select name="category_id" class="form-control" data-shortcode-attribute="category_id">
        @foreach($categories as $category)
            <option value="{{ $category->id }}">{{ $category->name }}</option>
        @endforeach
    </select>
</div>
