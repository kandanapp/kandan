## Cloud Foundry
You'll need a [Cloud Foundry account](https://my.cloudfoundry.com/signup) and the [vmc gem](https://rubygems.org/gems/vmc) installed. Do you `vmc target <cloud foundry host>` and `vmc login`, and then this will get you up and running:

    git clone https://github.com/kandanapp/kandan.git
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

    git clone https://github.com/kandanapp/kandan.git
    cd kandan
    heroku create --stack cedar
    git push heroku master
    heroku run rake db:migrate kandan:bootstrap && heroku open
    echo "Done, go forth and chat!"
    # Not too bad
    
### Integrate Kandan on Heroku with your Amazon S3_BUCKET ( [Heroku article on AWS S3 to store static assets and file uploads](https://devcenter.heroku.com/articles/s3) ). Run the following line, replacing the the global variable values with your own:

	heroku config:add S3_ACCESS_KEY_ID=xxx S3_SECRET_ACCESS_KEY=xxxx S3_BUCKET=bucket_name

If successful you should get a response similar to:

	Setting config vars and restarting myapp... done, v12
	S3_ACCESS_KEY_ID: xxx
	S3_SECRET_ACCESS_KEY: xxxx
	S3_BUCKET: bucket_name

Your app should be up and running now. The default admin user is `Admin` with password `kandanappadmin`, or you can sign up as another user.

## dotCloud
Looking for community help here.

## AppFog
You'll need an [AppFog account](https://www.appfog.com/) and the [af command line tool](https://docs.appfog.com/getting-started/af-cli) installed. Once that's all set up, login from the command line: `af login`. You'll be prompted for the username/password you set on AppFog. You're returned to your operating system's command prompt. It's not a terminal emulator.

If you want to use PostgreSQL rather than MySQL, provision the service on the Services page of the [console](https://console.appfog.com). Note the name of your database and app name on the console and substitute as appropriate.

    git clone https://github.com/kandanapp/kandan.git
    cd kandan
    bundle install
    bundle exec rake assets:precompile
    af push your_app_name --path . --instances 1 --mem 256M --runtime ruby19

You'll answer a few questions; you'll probably get an error at the end about an invalid app description. That's okay, we'll fix that next:

    Detected a Rails Application, is this correct? [Yn]: y
    1: AWS US East - Virginia
    2: AWS EU West - Ireland
    3: AWS Asia SE - Singapore
    4: Rackspace AZ 1 - Dallas
    5: HP AZ 2 - Las Vegas
    Select Infrastructure: 1
    Application Deployed URL [<your_app_name>.aws.af.cm]: <your_app_name>
    Memory reservation (128M, 256M, 512M, 1G, 2G) [256M]: 
    How many instances? [1]: 
    Bind existing services to '<your_app_name>'? [yN]: y
    1: kandan_production
    2: <your_app_name>-mysql-12781
    Which one?: 1
    Bind another? [yN]: n
    Create services to bind to '<your_app_name>'? [yN]: 
    Would you like to save this configuration? [yN]: y
    Manifest written to manifest.yml.
    Creating Application: Error 300: Invalid application description

If you get the invalid app description, open manifest.yml in a text editor and remove the space from the description. (It defaults to Rails Application, which causes the error.) Then, at the terminal:

    af update <your_app_name>

And you should also restart the app on AppFog (in the console). Then, Kandan should be available on your AppFox backend now! With your browser, visit the domain name assigned to you by AppFog (or create a CNAME record at your DNS provider to use an alternate).

## Heroic server install
If you're looking to install Kandan on a private server, or to develop locally for lemonodor fame, then here is the path you must follow, young hero:

You still need kandan (from above)
    git clone https://github.com/kandanapp/kandan.git
    cd kandan
    
Lots of the gems require other libraries:
    sudo apt-get install ruby1.9.1-dev libxslt-dev libxml2-dev libpq-dev libsqlite3-dev

For development-mode
    
    `sudo apt-get install nodejs` # (execjs needs an execution environment)
    `gem install execjs` # (Could possibly be added to the gemfile in the assets group)

Install the required gems:

    `bundle install`

You can use the default database.yml to get started in development. For production you'll need to edit config/database.yml to add something like this:

    production:
      adapter: postgresql
      host: localhost
      database: kandan_production
      pool: 5
      timeout: 5000
      # You might need these depending on your Postgres auth setup.
      username: kandan 
      password: something
 
Now, bootstrap the install (you can omit the db:create step if you have already created the DB referenced above):

    `bundle exec rake db:create db:migrate kandan:bootstrap`

If you plan to serve the app directly from Thin (rather than through a proxy), you will need to configure Rails to serve assets in the production environment. In config/environments/production.rb:
      
    config.serve_static_assets = true
    
Start the server

    `bundle exec thin start`

Your app should be up and running now. The default admin user is `Admin` with password `kandanappadmin`, or you can sign up as another user.
