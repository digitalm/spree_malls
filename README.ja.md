SpreeMalls
==================

Purpose
-------
* 外部ショッピングモールの価格に関する情報を管理することができます。

製品のサイドメニューへ「モール価格」を表示。
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls2.jpg)

「モール価格」 - edit(種類を選択)
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls3.jpg)

モール価格の管理
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls4.jpg)

モールの登録
![Malls](https://raw.githubusercontent.com/wiki/digitalm/spree_malls/images/malls4.jpg)

依存関係
------------
* [spree_add_on_menu](https://github.com/digitalm/spree_add_on_menu)

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

Copyright (c) 2014 [Exsight.inc](http://www.exsight.co.jp/) , released under the New BSD License