# encoding: utf-8

require 'hamlit'

page '/index.html'

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

  activate :sitemap_ping do |config|
    config.host = "#{@app.data.settings.site.url}"
  end

  activate :robots,
    rules: [{:user_agent => '*', :allow => %w(/)}],
    sitemap: @app.data.settings.site.url+'/sitemap.xml'
end
