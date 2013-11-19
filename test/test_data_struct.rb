require 'test/unit'
require File.dirname(__FILE__) + '/../lib/redcarpet_checkboxes/data_struct'

class DataStructTest < Test::Unit::TestCase

  def setup
    @struct = DataStruct.new
    @struct.key  = "value"
    @struct.test = true
  end

  def test_data_struct_exists
    assert @struct.is_a? DataStruct
  end

  def test_methods_turn_into_key_value_pairs
    assert_equal @struct.data["key"], "value"
    assert_equal @struct.data["test"], true
  end

  def test_serializable_hash
    assert_equal @struct.serializable_hash, { "key" => "value", "test" => "true" }
  end

  def test_underscores_turning_to_dashes
    @struct.okc_thunder = "awesome"
    assert @struct.data.has_key? "okc-thunder"
    assert_equal @struct.data["okc-thunder"], 'awesome'
  end

  def test_still_calls_real_method_missing
    assert_raise NoMethodError do
      @struct.this_will_fail # because it doesn't end in '='
    end
  end

end

