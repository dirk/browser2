# Browser

[![Travis-CI](https://travis-ci.org/dirk/browser2.png)](https://travis-ci.org/dirk/browser2)

Performance-optimized fork of the [`browser`](https://github.com/fnando/browser) Ruby gem.

## Installation

```bash
gem install browser
```

## Usage

```ruby
require 'rubygems'
require 'browser2'

browser = Browser.new ua: 'some string', accept_language: 'en-us'
browser.name            # readable browser name
browser.version         # major version number
browser.full_version
browser.safari?
browser.opera?
browser.chrome?
browser.chrome_os?
browser.mobile?
browser.tablet?
browser.console?
browser.firefox?
browser.ie?
browser.ie?(6)          # detect specific IE version
browser.edge?           # Newest MS browser
browser.modern?         # Webkit, Firefox 17+, IE 9+ and Opera 12+
browser.platform        # return :mac, :windows, :linux or :other
browser.ios?            # detect iOS
browser.ios?(9)         # detect specific iOS version
browser.mac?
browser.windows?
browser.windows_x64?
browser.linux?
browser.blackberry?
browser.blackberry?(10) # detect specific BlackBerry version
browser.bot?
browser.search_engine?
browser.phantom_js?
browser.quicktime?
browser.core_media?
browser.silk?
browser.android?
browser.android?(4.2)   # detect Android Jelly Bean 4.2
browser.known?          # has the browser been successfully detected?
browser.meta            # an array with several attributes
browser.to_s            # the meta info joined by space
```

See the [tests](https://github.com/dirk/browser2/blob/master/test/browser_test.rb) and [implementation](https://github.com/dirk/browser2/blob/master/lib/browser.rb) for more examples.

### Integrations

Browser comes out-of-the-box with helpers for use in Ruby on Rails applications and Rack servers. See [`doc/rails_and_rack.md`](doc/rails_and_rack.md) for more details.

### What defines a modern browser?

The current rules that define a modern browser are pretty loose:

* Webkit
* IE9+
* Microsoft Edge
* Firefox 17+
* Firefox Tablet 14+
* Opera 12+

You can define your own rules. A rule must be a proc/lambda or any object that implements the method === and accepts the browser object. To redefine all rules, clear the existing rules before adding your own.

```ruby
# Only Chrome Canary is considered modern.
Browser.modern_rules.clear
Browser.modern_rules << -> b { b.chrome? && b.version.to_i >= 37 }
```

### Internet Explorer

Internet Explorer has a compatibility view mode that allows newer versions (IE8+) to run as an older version. Browser will always return the navigator version, ignoring the compatibility view version, when defined. If you need to get the engine's version, you have to use `Browser#msie_version` and `Browser#msie_full_version`.

So, let's say an user activates compatibility view in a IE11 browser. This is what you'll get:

```ruby
browser.version
#=> 11

browser.full_version
#=> 11.0

browser.msie_version
#=> 7

browser.msie_full_version
#=> 7.0

browser.compatibility_view?
#=> true

browser.modern?
#=> false
```

This behavior changed in `v1.0.0`; previously there wasn't a way of getting the real browser version.

### Bots

Browser used to detect empty user agents as bots, but this behavior has changed. If you want to bring this detection back, you can activate it through the following call:

```ruby
Browser::Bots.detect_empty_ua!
```

## Authors

* [Dirk Gadsden](https://dirk.to) (`browser2` maintainer)
* [Nando Vieira](http://nandovieira.com.br) (original author of `browser`)

## License

Licensed under the MIT license. See [LICENSE](LICENSE) for details.
