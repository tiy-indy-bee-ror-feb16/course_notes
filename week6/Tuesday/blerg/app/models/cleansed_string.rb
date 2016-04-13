class CleansedString

  attr_accessor :name

  def initialize(string)
    self.name = string
    cleanse
  end

  def to_s_name
    self.name = name.to_s
  end

  def downcase_name
    name.downcase!
  end

  def change_spaces
    name.gsub!(/\s/, "_")
  end

  def http_sanitize
    self.name = URI.escape(name, "!?&")
  end

  def cleanse
    to_s_name
    downcase_name
    change_spaces
    http_sanitize
  end

  def to_s
    name
  end

end
