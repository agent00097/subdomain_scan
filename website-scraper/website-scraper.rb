#!/usr/bin/env ruby

# require 'timeout'
# require 'socket'
require 'net/ping'



#checking if the website is up
def up?(host)
  check = Net::Ping::External.new(host)
  check.ping?
end

#Getting the arguments
input_array = ARGV

def error_usage_message
    puts "USAGE: website-scraper [options] [Target IP]"
    exit
end


arguments_number = input_array.length

if arguments_number == 0
    #Here I will print the error usage message
    error_usage_message
end

website_name = input_array[0].to_s
puts website_name

puts up?(website_name)