"string".is_a? String
"string".include? "s"
[1,2,3,4].include? 1
puts "string".respond_to? :reverse

puts "string".reverse

class String

  def self.vowels
    %w(a e i o u A E I O U)
  end

  def to_piggy
    words = self.split
    piggied_words = words.map do |word|
      if self.class.vowels.include? word[0]
        word + "way"
      else
        non_vowels = ""
        letters = word.split(//)
        until self.class.vowels.include? letters[0]
          non_vowels << letters.shift
        end
        letters.join << non_vowels + "ay"
      end
    end
    piggied_words.join(" ")
  end

end

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
    ​
   def to_roman
     num = self
     ROMAN_CONVERT.map { |rom, val|
       repeat, num = num.divmod(val)
       rom * repeat }.join
   end

end

puts "string".reverse

puts "string".to_piggy

puts "amscray".to_piggy

puts "Banana underpants".to_piggy
# ananaBay underpantsway

our_latin = %Q(

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dapibus placerat turpis vel pharetra. Integer vel nunc ac tortor ornare fermentum a vulputate sem. Maecenas interdum tincidunt quam. Etiam maximus volutpat orci nec tincidunt. Nulla rutrum enim eget ligula vehicula, at luctus magna lacinia. Cras quis venenatis eros. Nunc vitae erat in nibh rutrum lobortis. Nam in elit eu urna mattis mollis.

Vivamus vitae finibus lectus, ac pretium nisi. Vivamus malesuada varius quam vitae pharetra. Nullam lobortis laoreet suscipit. Nulla facilisi. Ut elit ante, eleifend a convallis non, suscipit iaculis turpis. Aliquam facilisis fringilla feugiat. Duis velit est, facilisis ut leo in, lacinia fermentum nunc. Donec non erat auctor, sodales erat a, placerat orci. Vivamus in elementum leo, sit amet mattis est. Aenean vitae tristique ex, pretium tempus eros. Vestibulum viverra augue id elit molestie luctus. Proin laoreet velit vel pulvinar fringilla.

Aenean sodales nibh a dolor aliquet, id interdum arcu maximus. Cras non dictum metus. Cras sodales lacus sit amet est volutpat rutrum. Duis tempus leo et eros imperdiet, vel ornare nisi congue. Nam ut lorem facilisis, hendrerit nibh at, facilisis velit. Nulla ut lacus congue, posuere erat vel, pellentesque ipsum. Nulla vitae nibh egestas, varius sem et, interdum nibh. Ut vitae odio quis risus facilisis interdum ac nec massa. Nulla facilisi.

Ut magna odio, ornare tempor purus in, pharetra tempus purus. Pellentesque metus massa, congue non dolor et, pulvinar tincidunt velit. Vivamus at tempor tortor. Phasellus a placerat nulla, vitae commodo ipsum. Aliquam tincidunt at erat suscipit eleifend. Aliquam sed imperdiet mauris. Nunc luctus risus sit amet erat viverra, ut iaculis turpis tincidunt. Curabitur scelerisque semper purus, vitae dapibus quam aliquam ut. In et dignissim metus. Morbi risus mi, ornare lacinia mattis sit amet, porttitor rhoncus eros. Nunc imperdiet elit eu eleifend scelerisque.

Fusce non velit non ex sollicitudin ultricies. Pellentesque consectetur finibus lorem vitae viverra. Morbi in accumsan lectus. Integer semper ac felis vitae dignissim. Donec ut finibus felis. In cursus efficitur leo, quis pellentesque eros rhoncus in. Vestibulum bibendum a mauris ac placerat. Cras laoreet malesuada massa, nec commodo nulla vehicula vel. Aliquam tristique, erat non pellentesque mattis, lectus tortor consectetur ante, sed convallis ligula odio tempus purus. Sed ut mi vitae leo congue mattis ut at tellus. Suspendisse tempor eget massa in commodo. Nam vitae odio tempor, varius erat pharetra, malesuada elit.

)

puts our_latin.to_piggy


2016.to_roman
