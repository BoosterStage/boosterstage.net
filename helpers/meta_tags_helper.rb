# frozen_string_literal: true

# MetaTagsHelper
module MetaTagsHelper
  def meta_tag_description
    site_description = data.settings.site.description
    page_description = current_page.data.description || current_page.data.excerpt

    description = if page_description.nil? || page_description.empty?
                    site_description
                  else
                    page_description
                  end

    if description.nil? || description.empty?
      puts "== path:#{current_page.url} meta description is missing on settings.yml"
    elsif description.length > 150
      puts "== path:#{current_page.url} meta description should be between 140-150 characters. You have: #{description.length}"
    end
    description
  end

  def meta_tag_image(style = :twitter)
    if current_page.data.relative_image
      image_path current_page.data.relative_image
    elsif current_page.data.relative_image_path
      current_page.data.relative_image_path
    elsif relative_image?(style)
      relative_image_path(style)
    else
      data.settings.site.logo
    end
  end

  def meta_tag_title
    site_title = data.settings.site.title
    page_title = current_page.data.title || yield_content(:title)
    separator  = data.settings.site.title_separator

    if page_title.nil? || page_title.empty?
      return title = site_title
    else
      title = page_title
    end

    if title.blank?
      puts "== path:#{current_page.url} title is missing on settings.yml"
    elsif title.length > 70
      puts "== path:#{current_page.url} title should be under 70 characters. You have: #{title.length}"
    end
    title += ' ' + separator + ' '
    title += site_title
    title
  end

  def meta_tag_url
    host_url(current_page.url)
  end
end
