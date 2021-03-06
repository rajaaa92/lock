lock
====

A simple Rails 3 Engine that lets you lock down controllers, specific actions or an entire site with a password.  This engine is useful for locking down new features
or your entire site in production while your app is being beta tested.  This is not a full-blown user authentication engine, nor is it intended to be.


Forked from: https://github.com/charlotte-ruby/lock

Changed:
- locking app again
- removed unnecessary views


Install the gem
---------------

Add to your Gemfile

    gem "lock", git: 'git://github.com/rajaaa92/lock.git'

Install with bundler: bundle install

Generate the password file
--------------------------

The following command will generate /config/lock_password, which contains an encrypted password.  Lock uses this for authentication

    rails g lock:create_password_file yourpasswordhere

Lock your app
-------------

You lock your app in the ApplicationController (/app/controllers/application_controller.rb).

If you want to lock your entire app use this:

    ApplicationController < ActionController::Base
      lock
    end

If you want to lock specific actions inside the widgets_controller use this:

    ApplicationController < ActionController::Base
      lock :actions=>["widgets#new","widgets#index"]
    end

If you want to lock all actions in a controller, you can just leave off the # sign and action name.  The following will lock all actions in the widgets_controller

    ApplicationController < ActionController::Base
      lock :actions=>["widgets"]
    end

Unlock your app
---------------

1. Use the lock login url - /lock/login
2. Type in your password (from the generator) and press unlock

Override the views
------------------

You may want to customize the views to fit your app.  The easiest way to achieve this is to create the lock views directory - /app/views/lock, and
add your own view files.  The views should be named:

    /app/views/lock/login.html.erb    #login form

If you choose to override the login page, you will need to create a form that posts to /lock/unlock and uses a password field
named "password".

By default, these views will render inside your default layout.  To create a custom layout for these files, just add /app/views/layouts/lock.html.erb
The layout must contain a yield.

Lock your app again
-------------------

1. Use the lock url - /lock
2. You will be redirected to login page


Copyright
---------

Copyright (c) 2011 cowboycoded. See LICENSE.txt for
further details.

