# frozen_string_literal: true

module PageHelper
  def current_section
    current_page.eponymous_directory_path.split('/').first
  end

  def archive_date(page_type, year, month = nil, day = nil)
    case page_type
    when 'day'
      Date.new(year, month, day).strftime('%b %e %Y')
    when 'month'
      Date.new(year, month, 1).strftime('%b %Y')
    when 'year'
      year
    end
  end
end
