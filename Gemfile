source "https://rubygems.org"
gem 'jekyll'
gem 'jekyll-paginate'
gem 'jekyll-seo-tag'
gem 'jekyll-sitemap'
gem "webrick", "~> 1.7"
gem 'jekyll-postfiles'

gem "minima", "~> 2.5"
gem "github-pages", group: :jekyll_plugins
group :jekyll_plugins do
    gem "jekyll-feed", "~> 0.12"
  end

install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
gem "tzinfo", "~> 1.2"
gem "tzinfo-data"
end

gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?