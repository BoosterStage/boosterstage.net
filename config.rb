require 'hamlit'

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :blog do |blog|
  blog.name = 'articles'
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "articles"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.permalink = "articles/{title}"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.taglink = "articles/tags/{tag}.html"
  blog.layout = "article"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = "articles/{year}.html"
  blog.month_link = "articles/{year}/{month}.html"
  blog.day_link = "articles/{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

#
# Use webpack for assets
#
activate :external_pipeline,
         name: :webpack,
         command: build? ?  "yarn run build" : "yarn run start",
         source: "build",
         latency: 1

activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # Enable cache buster (except for images)
  activate :asset_hash, ignore: [/\.jpg\Z/, /\.png\Z/]
  activate :gzip
  activate :minify_html, remove_input_attributes: false
  activate :sitemap, hostname: @app.data.settings.site.url

  # activate :sitemap_ping do |config|
  #   config.host = "#{@app.data.settings.site.url}"
  # end
  #
  # activate :robots,
  #   rules: [{:user_agent => '*', :allow => %w(/)}],
  #   sitemap: @app.data.settings.site.url+'/sitemap.xml'
end
