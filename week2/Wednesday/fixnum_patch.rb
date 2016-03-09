class Fixnum

  ROMAN_CONVERT = {
     'M'   => 1000,
     'CM'  => 900,
     'D'   => 500,
     'CD'  => 400,
     'C'   => 100,
     'XC'  => 90,
     'L'   => 50,
     'XL'  => 40,
     'X'   => 10,
     'IX'  => 9,
     'V'   => 5,
     'IV'  => 4,
     'I'   => 1
   }

   def to_roman
     num = self
     ROMAN_CONVERT.map { |rom, val|
       repeat, num = num.divmod(val)
       rom * repeat }.join
   end

end

class String

  def from_roman
    string = self
    exceptions = Fixnum::ROMAN_CONVERT.select{|key, value| key.length > 1}
    regulars = Fixnum::ROMAN_CONVERT.select{|key, value| key.length == 1}
    exp_numbers = exceptions.flat_map { |rom, val|
      val if string.gsub!(rom, "")
    }.compact
    reg_numbers = regulars.flat_map { |rom, val|
      string.count(rom) * val }
    (exp_numbers + reg_numbers).inject(:+)
  end

end

puts 40.to_roman.from_roman

puts 2016.to_roman

puts 2016.to_roman.from_roman

(1..1000).each do |num|
  puts num.to_roman
  puts num.to_roman.from_roman
end

puts "Hi there, folks".upcase.from_roman
