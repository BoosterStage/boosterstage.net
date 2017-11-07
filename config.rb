require 'slim'

Time.zone = "America/Chicago"

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/feed.xml', layout: false
page '/404.html', directory_index: false

proxy "_redirects", "netlify-redirects", ignore: true

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
activate :minify_html

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
  activate :asset_hash, ignore: [/\.jpg\Z/, /\.png\Z/, /\.gif\Z/]
  activate :gzip
  # activate :minify_html, remove_input_attributes: false
  # activate :relative_assets

  set :relative_links, true

  activate :asset_host,
           host: @app.data.settings.site.url

  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source/images/logos/')
    f.output_dir    = File.join(root, 'build')
    f.icons = {
      'favicon_base.png' => [
        { icon: 'chrome-touch-icon-192x192.png' },
        { icon: 'apple-touch-icon.png', size: '152x152' },
        { icon: 'ms-touch-icon-144x144-precomposed.png', size: '144x144' },
        { icon: 'favicon-196x196.png' },
        { icon: 'favicon-160x160.png' },
        { icon: 'favicon-96x96.png' },
        { icon: 'favicon-32x32.png' },
        { icon: 'favicon-16x16.png' },
        { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
      ]
    }
  end

  activate :sitemap, hostname: @app.data.settings.site.url
  activate :sitemap_ping do |config|
    config.host = "#{@app.data.settings.site.url}"
  end

  activate :robots,
    rules: [{:user_agent => '*', :allow => %w(/)}],
    sitemap: @app.data.settings.site.url+'/sitemap.xml'
end
