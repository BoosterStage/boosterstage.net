module UrlsHelper
  def host_url(url)
    data.settings.site.url + url
  end

  def active_if(page)
    'is-active' if page == current_page.page_id
  end
end

