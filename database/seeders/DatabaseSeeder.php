<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Artisan::call('cms:plugin:activate:all');

        $this->call(UserSeeder::class);
        $this->call(LanguageSeeder::class);
        $this->call(PageSeeder::class);
        $this->call(MenuSeeder::class);
        $this->call(WidgetSeeder::class);
        $this->call(ContactSeeder::class);
        $this->call(ThemeOptionSeeder::class);
        $this->call(BlogSeeder::class);
        $this->call(GallerySeeder::class);
        $this->call(AdsSeeder::class);
    }
}
