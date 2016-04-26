class BundleAuthorPostsJob < ActiveJob::Base
  queue_as :default

  def perform(author_id, sale_id)
    sale = Payola::Sale.find(sale_id)
    author = Author.find(author_id)
    text = author.posts.map { |post| post.title + "\n" + post.body }
    text = text.join("\n\n")
    OrderMailer.author_mailer(sale.email, text, author).deliver_later
  end
end
