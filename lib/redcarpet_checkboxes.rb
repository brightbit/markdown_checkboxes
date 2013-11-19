require 'redcarpet'
require 'action_view'
require File.dirname(__FILE__) + '/redcarpet_checkboxes/data_struct'

class CheckboxMarkdown < Redcarpet::Markdown
  include ActionView::Helpers::FormTagHelper

  VERSION = '0.2.0'

  def render(text, &block)
    text = parse_with_checkboxes(text, &block)
    super(text)
  end

  private

  def parse_with_checkboxes(text, &block)
    checkbox_regex  = /-\s?\[(x|\s)\]/

    text.gsub(checkbox_regex).with_index do |current_match, current_index|
      checked = current_match =~ /x/ ? true : false

      body =
        text.gsub(checkbox_regex).with_index do |match, index|
          if index == current_index
            checked ? "- [ ]" : "- [x]"
          else
            match
          end
        end

      check_box_tag "check_#{current_index}", "", checked, data: data_options(body, &block)
    end
  end

  def data_options(body)
    if block_given?
      data_struct = DataStruct.new
      yield(data_struct, body)
      data_struct.serializable_hash
    else
      {}
    end
  end

end
