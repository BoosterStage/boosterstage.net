module PaginationHelper
  def page_link(current_pos, page_number, prev_page, next_page)
    p = nil
    i = current_pos
    (i .. page_number).each do
      p = p ? p.metadata[:locals]['prev_page'] : prev_page
    end
    (page_number .. i).each do
      p = p ? p.metadata[:locals]['next_page'] : next_page
    end
    return p

  end
end
