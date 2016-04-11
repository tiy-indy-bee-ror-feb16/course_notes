module CheepsHelper

  def rendered_cheep(cheep)
    text = cheep.body
    cheep.carrots.each do |carrot|
      text = text.sub(carrot.name, link_to(carrot.name, carrot).html_safe)
    end
    text
  end

end
