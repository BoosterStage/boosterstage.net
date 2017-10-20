require 'slim'

Time.zone = "America/Chicago"

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :blog do |blog|
  blog.calendar_template = 'calendar.html'
  blog.layout = 'article'
  blog.permalink = '{title}'
  blog.name = 'articles'
  blog.prefix = 'articles'
  blog.tag_template = 'tag.html'
  blog.taglink = "tagged/{tag}.html"
  blog.paginate = true
end

activate :blog do |blog|
  blog.name = 'portfolio'
  blog.prefix = 'portfolio'
  blog.permalink = '{title}'
  blog.layout = 'article'
end

page '/feed.xml', layout: false

#
# Use webpack for assets
#
activate :external_pipeline,
         name: :webpack,
         command: build? ?  'yarn run build' : 'yarn run start',
         source: 'build',
         latency: 1

activate :directory_indexes
activate :similar

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
  # activate :minify_html, remove_input_attributes: false
  activate :sitemap, hostname: @app.data.settings.site.url

  set :relative_links, true
  activate :relative_assets

  activate :asset_host,
           host: @app.data.settings.site.url

  # activate :sitemap_ping do |config|
  #   config.host = "#{@app.data.settings.site.url}"
  # end

  # activate :robots,
  #   rules: [{:user_agent => '*', :allow => %w(/)}],
  #   sitemap: @app.data.settings.site.url+'/sitemap.xml'
end
