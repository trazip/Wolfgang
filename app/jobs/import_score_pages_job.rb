require "open-uri"

class ImportScorePagesJob < ApplicationJob
  queue_as :default

  def perform(score)
    score.page_count.times do |i|
      url = Cloudinary::Utils.cloudinary_url(score.file.key, page: i + 1)
      page = Page.new(score: score)
      page.file.attach(io: open("#{url}.jpg"), filename: 'file')
      page.save
    end
  end
end
