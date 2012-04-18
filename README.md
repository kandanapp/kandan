Kandan - Modern Open Source Chat
================================
The slickest chat app out there. Open-source and well-supported to boot.

![](http://github.com/cloudfuji/kandan/raw/master/public/preview.png)

Standard Features
=================
These are features that work out of the box on any provider:

 * Easy deploy to Cloudfuji, CloudFoundry, Heroku, dotCloud, etc.
 * Collaborative team chat
 * Unlimited channels
 * Embed formats for images and youtube videos with requests for others (twitter, facebook, g+, etc.)
 * Synchronized sound player - play any audio-tag compatible url for the whole channel (Pending :P)
 * /me command!
 * Highly extensible plugin format

Cloudfuji Extended Features
===========================
In addition to the standard features above, Kandan can take advantage of Cloudfuji features when run on our cloud:

* One-click deploy
* Team-aware: Setup your team once, and have them in every Cloudfuji app
* Event-aware: Build widgets that display build status, customer signups, website status, and much more

SHUT UP AND LET ME USE IT
=========================

## Cloudfuji
If you're part of the [Cloudfuji Beta](http://cloudfuji.com) you already have access to Kandan with all the enhanced features from the app store.

Just click launch http://cloudfuji.com/apps/new?app=kandan; you and your team should be all setup.

## Cloud Foundry
You'll need a [Cloud Foundry account](https://my.cloudfoundry.com/signup) and the [vmc gem](https://rubygems.org/gems/vmc) installed. Do you `vmc target <cloud foundry host>` and `vmc login`, and then this will get you up and running:

    git clone https://github.com/cloudfuji/kandan.git
    cd kandan
    bundle install
    bundle exec rake assets:precompile
    vmc push my-company-chat --path . --instances 1 --mem 256M --runtime ruby19
    
You'll answer a few questions:

    Application Deployed URL [my-company-chat.cloudfoundry.com]: 
    Detected a Rails Application, is this correct? [Yn]: 
    Creating Application: OK
    Would you like to bind any services to 'my-company-chat'? [yN]: y
    Would you like to use an existing provisioned service? [yN]: n
    The following system services are available
    1: mongodb
    2: mysql
    3: postgresql
    4: rabbitmq
    5: redis
    Please select one you wish to provision: 3
    Specify the name of the service [postgresql-246de]: 
    Creating Service: OK
    Binding Service [postgresql-246de]: OK
    Uploading Application:
    Checking for available resources: OK
    Processing resources: OK
    Packing application: OK
    Uploading (1M): OK   
    Push Status: OK
    Staging Application: OK
    Starting Application: OK
    
And Kandan should be available on your Cloud Foundry backend now!

## Heroku
You'll need to have the [heroku gem](https://github.com/heroku/heroku) installed and to have an existing heroku account. Assuming that, this should work reliably on Heroku:

    git clone https://github.com/cloudfuji/kandan.git
    cd kandan
    heroku create --stack cedar
    git push heroku master
    heroku run rake db:migrate kandan:bootstrap && heroku open
    echo "Done, go forth and chat!"
    # Not too bad
    
    
Your app should be up and running now. The admin email by default is `admin@kandan.me` with password `kandanadmin`, or you can sign up as another user.

## dotCloud
Looking for community help here.

## Masochist server install
If you're looking to install Kandan on a private server (why??) then here are some notes you'll want to read:

    # For development-mode
    sudo apt-get install nodejs # (execjs needs an execution environment)
    gem install execjs # (Could possibly be added to the gemfile in the assets group)

    # Add this to the gemfile:
    group :development do  
      gem 'sqlite3'
    end

    # Get the new gems
    bundle install

    # Use the default database.yml to get started
    cp config/database.yml.sample config/database.yml

    # Edit config/database.yml if you want to use postgres/mysql

    # Bootstrap the install
    bundle exec rake db:create db:migrate kandan:bootstrap
    bundle exec rails server

    
TODO
====
See the issue tracker

Get Involved!
=============
That's not a question, it's an order! Or more of a friendly offer, really. Kandan is a fully open-source app, so dive in and start adding features, fixing bugs (what bugs?), and cleaning up the code.

* Talk with us on the [mailing list])(https://groups.google.com/forum/?fromgroups#!forum/cloudfuji)
* GitHub [issues tracker](https://github.com/cloudfuji/kandan/issues)
* Twitter [@cloudfuji](https://twitter.com/#!/cloudfuji)
* [New-wave open-source meetup](www.meetup.com/San-Francisco-New-Wave-Open-Source-Apps/) - we meetup once a month to share tips on how developers grow business around super high-quality open source software
* ... is there a fifth way? Telegram maybe?

Credits
=======
* [Sacha Greif](http://sachagreif.com/i-wrote-a-book/) for his __amazing__ design job and exacting implementation standards on Kandan. A wonder and a pleasure to work with.
* [Andrew Hampton](https://github.com/andrewhampton) For the initial manual server install instructions.
* [Thomas Risberg](https://github.com/trisberg) For the Cloud Foundry install instructions and compatibility fixes.
* [Cloudfuji](http://cloudfuji.com) for leading and sponsoring the initial development of Kandan

LICENSE
=======
Kandan's code and assets are dual-licensed. Kanda is available generally under the AGPL, and also under a custom license via special agreement. See LICENSE for the AGPL terms, and contact us at [support@cloudfuji.com](mailto:support@cloudfuji.com) if you're interested in development of Kandan under a custom license.
