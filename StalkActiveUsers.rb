#!/usr/bin/env ruby

require 'open-uri'

youtubeLink = "http://www.youtube.com/all_comments?v=" + ARGV[0]
if ARGV[0].start_with?("http")
	youtubeLink = ARGV[0]
end

getresult = open(youtubeLink,"UserAgent" => "Ruby-OpenURI").read

puts "Fetching most recent/top commenters for: " + ARGV[0]

a = getresult.scan(/<a href="\/user\/(.*?)" class="yt-uix-sessionlink yt-user-name "/)
a.delete_at(0) 	# remove author garbage
a = a.uniq	# remove duplicates

output = a.transpose.map{|col| col.join(', ')}.join(', ')
puts output
