class StuffController < ApplicationController

  def index
    if params[:q]
      response = client.character(params[:q])
      if response.code == 200
        @character = response.data['results'].first
      else
        @error = "That's a no good"
      end
      github_response = github.search_repositories(params[:q])
      @repos = github_response.items
    end
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  private

  def client
    @client ||= Marvelite::API::Client.new(
                  :public_key   => ENV['marvel_public_key'],
                  :private_key  => ENV['marvel_private_key']
                )
  end

  def github
    @github ||= Octokit::Client.new(access_token: ENV['github_access_token'])
  end

end
