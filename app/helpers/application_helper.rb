module ApplicationHelper

  def no_records_available
    content_tag(:div, class: 'card mt-3') do
      content_tag(:div, 'No records found.', class: 'card-body text-center')
    end
  end

  def ndash
    '–'
  end

  def format_string(string)
    string.presence || ndash
  end

  def format_text(text)
    return ndash if text.blank?

    safe_text = h(text)
    paragraphs = split_paragraphs(safe_text).map(&:html_safe)

    html = ''.html_safe
    paragraphs.each do |paragraph|
      html << content_tag(:p, paragraph)
    end
    html
  end

end
