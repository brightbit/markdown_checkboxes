require 'redcarpet'
require 'action_view'
require 'markdown_checkboxes/data_struct'

class CheckboxMarkdown < Redcarpet::Markdown
  include ActionView::Helpers::FormTagHelper

  CHECKBOX_REGEX = /-\s?\[(x|\s)\]/

  def render(text, html_options = {}, &block)
    super(parse_with_checkboxes(text, html_options, &block))
  end

  private

  def parse_with_checkboxes(text, html_options, &block)
    text.gsub(CHECKBOX_REGEX).with_index do |current_match, current_index|
      checked = current_match =~ /x/
      body = updated_body(text, current_index, checked)

      check_box_tag("check_#{current_index}", '', checked, **html_options, data: data_options(body, &block))
    end
  end

  def data_options(body, &block)
    DataStruct.new(body, &block).data
  end

  def updated_body(text, current_index, current_checked)
    text.gsub(CHECKBOX_REGEX).with_index do |match, index|
      next match if index != current_index
      current_checked ? '- [ ]' : '- [x]'
    end
  end

end
