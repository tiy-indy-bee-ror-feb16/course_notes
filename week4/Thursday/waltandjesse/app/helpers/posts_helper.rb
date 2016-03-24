module PostsHelper

  def active_li
    case params[:action]
    when "index"
      '<li class="active">'.html_safe
    else
      '<li>'.html_safe
    end
  end

end
