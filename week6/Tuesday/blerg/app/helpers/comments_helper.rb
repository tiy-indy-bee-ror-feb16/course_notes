module CommentsHelper

  def comment_parent_link(comment)
    unless url_identical?(comment)
      link_to("Parent", linkable_objects(comment)).html_safe
    end
  end

  def url_identical?(comment)
    url_for(linkable_objects(comment)) == request.original_fullpath
  end

  def linkable_objects(comment)
    [comment.commentable.commentable, comment.commentable].uniq
  end

end
