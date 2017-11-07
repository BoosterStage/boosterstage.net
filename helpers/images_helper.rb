# frozen_string_literal: true

# ImagesHelper
module ImagesHelper
  # Filesystem helpers
  def relative_image?(style, article = current_page)
    File.file?(relative_image_file_path(filename(style), article))
  end

  def relative_image_file_path(style, article = current_page)
    File.join(app_root, 'source', article.eponymous_directory_path, filename(style))
  end

  # Image path helpers
  def relative_image_tag(style, article = current_page)
    image_tag relative_image_path(style, article)
  end

  def relative_image_path(style, article = current_page)
    article.url + filename(style)
  end

  def filename(style)
    if style.is_a?(Symbol)
      style.to_s + '.jpg'
    else
      style
    end
  end

  def app_root
    @app.root
  end
end
