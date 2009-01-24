Specs
=====

To run the Locomotive specs, you'll need to have the Webrat gem installed.
Otherwise, its highly likely you'll come across an uninitialized constant 
Merb::Test::ViewHelper error when executing rake:spec.

To install Webrat, follow the most up-to-date instructions here:
http://github.com/brynary/webrat/tree/master/README.rdoc

 * Install relevant development/header files for your system, to compile
   nokoguri's C-extensions (a prerequisite for Webrat).
 * Then proceed with the Gem installation:
  
  gem install webrat

