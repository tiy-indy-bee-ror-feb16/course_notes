# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authenticate_admin

    def authenticate_admin
      require_author
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
    private

    def current_author
      @current_author ||= Author.find(session[:author_id]) if session[:author_id]
    end

    def require_author(default_flash="You must be logged in to do that.")
      session[:intended_destination] = request.original_url
      if current_author && current_author.role != 'admin'
        flash[:danger] = "You're not authorized to do that."
        redirect_to :root
      elsif !current_author
        flash[:danger] = default_flash
        redirect_to login_path
      end
    end
  end
end
