class OrderMailer < ApplicationMailer

  def order_complete(sale)
    @post = sale.product
    mail(to: sale.email, subject: 'Your purchase from Blerg')
  end

  def author_mailer(email, text, author)
    @text = text
    @author = author
    mail(to: email, subject: "Your bundle of #{@author.name} posts")
  end

end
