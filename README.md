SpreeMalls
==========

Purpose
-------
* Enable to manage price information on the mall that you are opening stores outside spree.

Show link "MALL PRICES" to Product side menu.
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls2.jpg)

"MALL PRICES" show variant list. Select particular variant and edit
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls3.jpg)

Admin can manage Mall Price informations.
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls4.jpg)

Be sure to create Mall list before manage.
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls4.jpg)

Dependency
------------
It needs 
* [spree_add_on_menu](https://github.com/digitalm/spree_add_on_menu) for admin menu tab expanding

Installation
------------

Add spree_malls to your Gemfile:

```ruby
gem 'spree_malls'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_add_on_menu:instal
bundle exec rails g spree_malls:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_malls/factories'
```

Copyright (c) 2014 [Exsight.inc](http://www.exsight.co.jp/) , released under the New BSD Licensee
