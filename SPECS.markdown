Specs and Acceptance Testing
============================

Locomotive uses unit, integration and acceptance testing.

Specs
-----

To run the Locomotive specs, you'll need to have [webrat][Webrat] installed.
Otherwise, its highly likely you'll come across an uninitialized constant
Merb::Test::ViewHelper error when executing rake:spec.

To install Webrat, follow the most up-to-date instructions here:
<http://github.com/brynary/webrat/tree/master/README.rdoc>

 * Install relevant development/header files for your system, to compile
   nokoguri's C-extensions (a prerequisite for Webrat).
 * Then proceed with the gem installation:

    sudo gem install webrat

Feature/Acceptance Testing
---------------------------

You'll also want to have [cucumber][Cucumber] installed for testing features.

Installation should be as follows:

    sudo gem install cucumber
    sudo gem sources -a http://gems.github.com
    sudo gem install jsmestad-merb_cucumber

You should then be able to execute `rake features`.

Note: We are using [jsmestad-merb_cucumber][jsmestad's fork of merb_cucumber],
instead of [david-merb_cucumber][david's], as it contains a number of important
fixes for compatibility with Webrat 0.4.x.

[jsmestad-merb_cucumber]:http://github.com/jsmestad/merb_cucumber/tree/master
[david-merb_cucumber]:http://github.com/david/merb_cucumber/tree/master
[cucumber]:http://cukes.info/
[rspec]:http://rspec.info/
[webrat]:http://gitrdoc.com/brynary/webrat/tree/master/
