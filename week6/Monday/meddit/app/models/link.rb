class Link < ActiveRecord::Base
  has_many :votes
  before_validation :add_http_if_not_present

  validates :url, :format => { with: /\Ahttp(|s):\/\// }

  def add_http_if_not_present
    unless self.url =~ /\Ahttp(|s):\/\//
      self.url = "http://" + url
    end
  end

end
