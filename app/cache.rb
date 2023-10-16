class Cache
  def self.instance
    @instance ||= self.new
  end

  def set(key, value)
    store[key] = value
  end

  def get(key)
    store[key]
  end

  def store
    @store ||= {}
  end
end
