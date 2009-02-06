Install
=======

Locomotive is currently available in two forms: both as a Merb application, and
as a Merb slice.

System Requirements
-------------------

The system requirements should be broadly the same as for Merb 1.0.x and
DataMapper 0.9.x series.

Unfortunately, DataObjects, which DataMapper is built on top of, has only
emerging support for JRuby, and is not (yet) ready for production.

Install as an Application
-------------------------

    bin/thor merb:gem:redeploy

http://wiki.merbivore.com/deployment/bundling

Install as a Slice
-------------------

You can test that Locomotive executes correclty as a slice with the `slice`
command.

This slice is still under heavy development and not yet available in any public
gems repositories. Therefore you'll need to install the slice from the
Locomotive repo as follows:

    rake package
    sudo rake install

(the first command is not strictly necessary, but you'll end up with a package
 folder belonging to root if you execute only the second command)

Then follow these steps to get a working slice host app:

  1. Create (or generate) a new Merb application:

        merb-gen app locomotive_for_mycompany
  2. Add the Locomotive dependency to your `config/dependencies.rb` file:

        dependency "locomotive"
  3. Add Locomotive's dependencies to your `config/dependencies.rb` file:

        dependency "merb-haml"
    
     (Refer to Locomotive's [dependencies.rb][d.rb] for the list of dependencies)
  4. Add the Locomotive slice to your `config/router.rb` file:

        slice(:locomotive, :name_prefix => nil)
  5. Customize your database settings in `config/database.yaml` as appropriate.
  6. Then, create/automigrate your database:

        rake db:create
        rake db:automigrate
  7. And run it:

        merb

Alternatively, if you prefer to get up and running even faster, then consider
basing your app on the locomotive sample application. You can clone and fork
the repository from [http://github.com/nedap/locomotive\_sample\_app/][sample].

[d.rb]: http://github.com/nedap/locomotive/tree/master/config/dependencies.rb
[sample]: http://github.com/nedap/locomotive_sample_app/tree/master

