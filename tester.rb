require "sinatra"
get("/about/*") {
#  "cat"
#  get("/about") {
  if params[:splat][0] =~ /^a.*/
 "you entered : " + params[:splat].inspect
# # "hello"
  end
  }
get '/form' do
  erb :form
end

post '/form' do
  params[:message].upcase +   " : OK"
end

not_found do
  halt 404, 'Sorry, page not found'
  end

#require 'csv'
#
#arr = [1,2,3]
## infile = File.new(Dir.getwd+"/lines.txt","r")
#infile = File.new("lines.txt","r")
#
#infile.each { |line|
#  puts line
#}
#puts ":#{Dir.getwd}:"
#CSV.foreach("lines.csv") {|line|
#puts line.inspect
#}
#arr.each {  |a|
#  s = "cat"
#  puts "before"
#  puts a.to_s
#  puts "after"
#
#}
#
#s = "hat"
#f = s.gsub(/a/,'o')
#    puts f
#
#
