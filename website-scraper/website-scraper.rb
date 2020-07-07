#!/usr/bin/env ruby

require 'net/ping'
require 'net/http'



#checking if the website is up
def up?(host)
  check = Net::Ping::External.new(host)
  check.ping?
end

#Getting the arguments
input_array = ARGV

def error_usage_message
    puts "USAGE: website-scraper [options] [Host]"
    exit
end


arguments_number = input_array.length

if arguments_number == 0
    #Here I will print the error usage message
    error_usage_message
end

website_name = input_array[0].to_s

if (up?(website_name) == false)
  puts "Host you mentioned is unreachable"
end

source = Net::HTTP.get(website_name, '/index.html')
puts source