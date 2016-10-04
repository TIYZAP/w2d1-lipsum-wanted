#!/usr/bin/env ruby
require 'erb'        #Needed in order to run index.html.erb!

require 'shellwords' #Needed in order to run shellescape!



lipsum_wanted = ARGV[0].to_s.downcase
#Arguments below were created to display more than one paragraph!
multiple_paragraphs = ARGV[1].to_i
if multiple_paragraphs < 1
  multiple_paragraphs = 1
end


puts ARGV.inspect
puts lipsum_wanted




sam = "My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?"

hipster = "Typewriter VHS you probably haven't heard of them esse, photo booth butcher direct trade mlkshk small batch fixie kickstarter poke crucifix sustainable. Truffaut williamsburg vape, shoreditch lumbersexual franzen woke retro. Nihil nesciunt bushwick velit tacos neutra. Readymade jean shorts hexagon, chartreuse seitan ex woke tempor elit meh iPhone veniam. Meh roof party chambray paleo pug, pour-over nisi blog vape fugiat vero beard. Sapiente 3 wolf moon drinking vinegar, do portland kitsch labore iceland consectetur flexitarian est farm-to-table fixie humblebrag scenester. Vinyl fugiat vice sed, synth sustainable hoodie esse squid tumeric echo park tbh."

oldschool = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus felis, ultrices non feugiat sit amet, vulputate et quam. Mauris at ex orci. Etiam feugiat urna et augue rutrum, vitae rutrum est venenatis. Sed libero dolor, molestie nec sodales vel, vestibulum quis libero. Nulla sed porttitor nunc, eu tincidunt augue. Integer et nisi sit amet arcu hendrerit condimentum vel et nisi. Nam pulvinar est est, consequat dictum libero placerat non. Etiam pellentesque at justo nec aliquam. Ut interdum lacus nec ligula scelerisque efficitur. Mauris suscipit augue et dapibus pellentesque. Donec condimentum sagittis nunc, in blandit nulla volutpat ac. Aliquam faucibus euismod erat id scelerisque. Sed malesuada luctus tortor at finibus. Nulla fermentum arcu eu ante condimentum pellentesque. Quisque efficitur augue nec arcu ullamcorper, eu tincidunt metus malesuada. Suspendisse in odio et massa commodo mattis."

if lipsum_wanted == "samuel"
  output = sam

elsif lipsum_wanted == "hip"
  output = hipster

elsif lipsum_wanted == "old"
  output = oldschool

else
  puts "Pick from one of these. samuel, hip or old"
end

puts output.inspect #Displays output in Terminal!




if output
system ("echo #{(output * multiple_paragraphs).shellescape} | pbcopy") #Copies lipsum to clip board!
new_file = File.open("./#{lipsum_wanted}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
end
