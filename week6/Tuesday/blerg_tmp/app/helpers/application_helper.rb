module ApplicationHelper

  def post_author_links(post)
    author_links = post.authors.map do |author|
      link_to author.name, author
    end
    author_links.to_sentence.html_safe
  end

end
