class Page < ApplicationRecord
  validates :url, presence: true
  validate :url_accessible?
  before_create :set_content

  def set_content
    self.content ||= Extractor.new(self.url).call
  end

  private :set_content

  def url_accessible?
    success = begin
      response = HTTParty.get(self.url)
      (response.code == 200 || response.code == 302)
    rescue
      false
    end
    errors.add(:url, 'is not valid or it cannot be accesse at this moment') unless success
  end

  private :url_accessible?
end
