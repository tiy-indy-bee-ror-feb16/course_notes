module WelcomeHelper
  include Reverser

  def span_first_word(text)
    string = text.split(" ").map(&:titlecase)
    string = "<span>#{string[0]}</span> #{string[1..-1].join(" ")}"
    string.html_safe
  end

end
