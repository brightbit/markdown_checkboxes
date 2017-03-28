require 'test/unit'
require 'markdown_checkboxes/data_struct'

class DataStructTest < Test::Unit::TestCase

  def setup
    @struct = DataStruct.new('Lorem ipsum...')
    @struct.key  = 'value'
    @struct.test = true
  end

  def test_data_struct_exists
    assert @struct.is_a? DataStruct
  end

  def test_methods_turn_into_stringified_key_value_pairs
    assert_equal @struct.data['key'], 'value'
    assert_equal @struct.data['test'], 'true'
  end

  def test_underscores_turning_to_dashes
    @struct.okc_thunder = 'awesome'
    assert @struct.data.has_key?('okc-thunder')
    assert_equal @struct.data['okc-thunder'], 'awesome'
  end

  def test_still_calls_real_method_missing
    assert_raise NoMethodError do
      @struct.this_will_fail # because it doesn't end in '='
    end
  end

  def test_responds_to_setters
    assert_respond_to @struct, :setter=
    assert_respond_to @struct, :alt_setter=
  end

  def test_responds_to_data_keys_getters
    @struct.okc_thunder = 'awesome'
    assert_respond_to @struct, :okc_thunder
    refute_respond_to @struct, :getter
  end

end
