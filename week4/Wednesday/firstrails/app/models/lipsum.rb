class Lipsum

  attr_accessor :output

  def initialize(wanted, num=1)
    available = %w(standard hipster)
    if available.include? wanted
      self.output = self.send(wanted.to_sym) * num.to_i
    else
      self.output = default
    end
  end

  def standard
    "srg dth rtf jyt ytj tyf j tgf fthj trfh trf hjt rtjf tf\n\n"
  end

  def hipster
    "srg edthrt 6jr6ht hr tjtyjy yuk uykj fugy vjytdf dhfth ftjtytjyt\n\n"
  end

  def default
    "Please enter a lipsum"
  end

  def to_s
    output
  end

end
