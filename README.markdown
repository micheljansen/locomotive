Locomotive
==========

*An open-source monitoring and deployment control panel*

Locomotive is a control panel for monitoring and deploying applications,
services and the like. It aims to be flexible and extensible to suit
the changing needs of developers and administrators in a painless
way.

Goals
-----

The goal of Locomotive is to be a flexible control panel for managing all kinds
of stuff for Software as a Service providers; most importantly the tasks of
monitoring and deploying services. It was born out of the urge to "scratch our
own itch" over at Nedap Healthcare, where we provide a number of different
services for a large number of clients. Some predicates taken from this
situation are:

* There are multiple clients, each of which has a contract for one or more
  services.
* Clients don't share services. For each of the clients, a separate instance of
  any service is deployed, possibly with a different version or a different set
  of features.
* Services can be deployed to one or more servers. Some services may require a
  number of services, some servers may run multiple services or multiple parts
  of multiple applications (e.g. a dedicated database cluster running databases
  for all clients).

Last but not least, Locomotive aims to be extensible. No two services are
likely to be the same and we don't want to force them to be. It should be easy
to extend Locomotive to support exotic kinds of services by implementing an
API, but the goal is to keep the amount of "service specific patchwork" to a
minimum.

_-- Michel Jansen_

Licensing and Copyright
-----------------------

Locomotive is released under an **MIT License** . Copyright information, as well as
a copy of the License may be found in the accompanying LICENSE file.

Installation
------------

See INSTALL.markdown.

Support
-------

(note that this project is still miles off its baby shower)

* [Locomotive Homepage](http://locomotiveapp.com/)
* [Locomotive Wiki](http://wiki.github.com/nedap/locomotive)
* [Locomotive Issues](http://nedaphealthcare.lighthouseapp.com/projects/7313-locomotive)

Sponsorship
-----------

The development of Locomotive has been brought to you by [Nedap Healthcare][nedap].

[nedap]: http://www.nedap-healthcare.com
