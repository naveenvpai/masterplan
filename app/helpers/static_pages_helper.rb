module StaticPagesHelper
  def get_generic_title(page_title = '')
    base_title = "Masterplan"
    return (!page_title.empty? ? page_title + " | " : "") + base_title
  end
end
