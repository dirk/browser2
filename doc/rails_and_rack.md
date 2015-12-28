## Rack & Rails

Browser comes with helpers and middleware for integrating with both Ruby on Rails and Rack servers.

### Rails helpers

Just add it to the Gemfile.

```ruby
gem 'browser2'
```

This adds a helper method called `browser`, that inspects your current user agent.

```erb
<% if browser.ie?(6) %>
  <p class="disclaimer">You're running an older IE version. Please update it!</p>
<% end %>
```

### Middleware

You can use the `Browser::Middleware` to redirect user agents.

```ruby
use Browser::Middleware do
  redirect_to '/upgrade' unless browser.modern?
end
```

If you're using Rails, you can use the route helper methods. Just add something like the following to a initializer file (`config/initializers/browser.rb`).

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  redirect_to upgrade_path unless browser.modern?
end
```

Notice that you can have multiple conditionals.

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  next if browser.search_engine?
  redirect_to upgrade_path(browser: "oldie") if browser.ie? && !browser.modern?
  redirect_to upgrade_path(browser: "oldfx") if browser.firefox? && !browser.modern?
end
```

If you need access to the `Rack::Request` object (e.g. to exclude a path), you can do so with `request`.

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  redirect_to upgrade_path unless browser.modern? || request.env['PATH_INFO'] == '/exclude_me'
end
```
