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
  
  count = 0
  doc.css('.txt').each do |items|
    list = items.text.split("\r\n")
    
    if !list[0].include?(':')
      c = courses[count].categories.build(:name => 'Default')
      c.save!
    end
    
    list.count.times do |times|
      if list[times].include?(':')
        c = courses[count].categories.build(:name => list[times])
        c.save!
      end
    end
    
    count += 1
  end
end
