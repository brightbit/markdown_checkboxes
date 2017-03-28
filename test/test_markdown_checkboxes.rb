require 'test/unit'
require 'markdown_checkboxes'

class MarkdownCheckboxesTest < Test::Unit::TestCase

  def setup
    @m ||= CheckboxMarkdown.new(Redcarpet::Render::HTML.new)
  end

  def test_proper_markdown_inheritance
    assert @m.is_a? CheckboxMarkdown
    assert @m.is_a? Redcarpet::Markdown # Superclass
  end

  def test_standard_markdown
    assert_equal @m.render('## Hello'), "<h2>Hello</h2>\n"
    assert_equal @m.render('**Bold**'), "<p><strong>Bold</strong></p>\n"
  end

  def test_checkbox_existence
    assert_match(/<input.* \/>/,    @m.render('- [ ]'))
    assert_match(/type="checkbox"/, @m.render('- [ ]'))
  end

  def test_checkbox_check_attribute
    assert_match(/checked="checked"/,     @m.render('- [x]'))
    assert_no_match(/checked="checked"/,  @m.render('- [ ]'))
  end

  def test_checkbox_data_setting
    assert_match(
      /data-remote="true"/,
      @m.render('- [ ]') { |data, _| data.remote = true }
    )

    assert_match(
      /data-method="put"/,
      @m.render('- [x]') do |data, _|
        data.remote = true
        data.method = :put
      end
    )
  end

  def test_checkbox_disabled_html_option
    assert_match(/disabled="disabled"/, @m.render('- [ ]', disabled: true))
    assert_match(/disabled="disabled"/, @m.render('- [x]', disabled: true))
    refute_match(/disabled/, @m.render('- [ ]', disabled: false))
    refute_match(/disabled/, @m.render('- [x]', disabled: false))
    refute_match(/disabled/, @m.render('- [ ]'))
    refute_match(/disabled/, @m.render('- [x]'))
  end
end
