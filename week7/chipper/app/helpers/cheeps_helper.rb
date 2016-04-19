module CheepsHelper

  def rendered_cheep(cheep)
    text = sanitize(cheep.body)
    cheep.carrots.each do |carrot|
      text = text.sub(carrot.name, link_to(carrot.name, carrot))
    end
    text.html_safe
  end

end
