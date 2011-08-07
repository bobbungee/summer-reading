desc "Fetch summer reading list"
task :fetch_summer_reading => :environment do
  require 'nokogiri'
  require 'open-uri'
  
  # Delete all courses
  Course.delete_all
  
  url = 'http://classroom.kleinisd.net/webs/ibkleinoak/summer_reading_list.htm'
  doc = Nokogiri::HTML(open(url))
  courses = []
  
  doc.css('.headline').each do |title|
    courses << Course.create!(:name => title.text)
  end
end
