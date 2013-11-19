class DataStruct
  attr_accessor :data

  def initialize
    @data = {}
  end

  def serializable_hash
    Hash[@data.map { |k,v| [k.to_s, v.to_s] }]
  end

  def method_missing(name, *args, &block)
    if name.to_s =~ /=$/
      @data[name.to_s.gsub('_', '-').chop] = args.first
    else
      super(name, *args, &block)
    end
  end
end

