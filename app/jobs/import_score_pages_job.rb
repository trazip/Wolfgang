require "open-uri"

class ImportScorePagesJob < ApplicationJob
  queue_as :default

  def perform(score)
    sleep(2)
    score.page_count.times do |i|
      url = Cloudinary::Utils.cloudinary_url(score.file.key, page: i + 1)
      page = Page.new(score: score)
      page.file.attach(io: page_file(url), filename: 'file')
      page.save
    end
  end

  private

  def page_file(page_url)
    open("#{page_url}.jpg")
  rescue OpenURI::HTTPError
    open("#{page_url}.png")
  end
end
