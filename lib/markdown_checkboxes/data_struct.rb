class DataStruct
  attr_accessor :data

  def initialize(body)
    @data = {}
    yield(self, body) if block_given?
  end

  def method_missing(name, *args, &block)
    return super if !is_setter(name)
    @data[dashed(name)] = args.first.to_s
  end

  def respond_to_missing?(method_name, include_private = false)
    is_setter(method_name) || @data.has_key?(dashed(method_name)) || super
  end

  private

  def is_setter(method_name)
    !!(method_name.to_s =~ /=\z/)
  end

  def dashed(value)
    value.to_s.gsub('_', '-').sub(/=\z/, '')
  end
end
