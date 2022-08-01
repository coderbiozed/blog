<?php

namespace Database\Seeders;

use Botble\ACL\Models\User;
use Botble\ACL\Repositories\Interfaces\ActivationInterface;
use Botble\Base\Supports\BaseSeeder;
use MetaBox;
use Schema;

class UserSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $files = $this->uploadFiles('users');

        Schema::disableForeignKeyConstraints();

        User::truncate();

        $user = new User;
        $user->first_name = 'Steven';
        $user->last_name = 'Madden';
        $user->email = 'admin@botble.com';
        $user->username = 'botble';
        $user->password = bcrypt('159357');
        $user->super_user = 1;
        $user->manage_supers = 1;
        $user->avatar_id = !empty($files) ? $files[0]['data']['id'] : null;
        $user->save();

        event('acl.activating', $user);

        $activationRepository = app(ActivationInterface::class);

        $activation = $activationRepository->createUser($user);

        event('acl.activated', [$user, $activation]);

        MetaBox::saveMetaBoxData($user, 'bio', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi autem blanditiis deleniti inventore porro quidem rem suscipit voluptatibus! Aut illum libero, praesentium quis quod rerum sint? Ducimus iure nulla totam!');

        return $activationRepository->complete($user, $activation->code);
    }
}
