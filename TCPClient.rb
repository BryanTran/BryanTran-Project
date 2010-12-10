require 'net/telnet'

#This is a new comment added - Do the commit with out 
#add and expect it will not add this comment
server = Net::Telnet::new('Host' => '127.0.0.1',
'Port' => 1234,
'Telnetmode' => false)

#When we first connect to the server, we want to see if we are
#get any menu from the server.

server.waitfor(/./) do |data|
puts data
end

#This variable is needed so that we can exit out the
#keyboard input reading.
exit = 0

#If there is any input from the keyboard, we send them
#to server and wait for the response from the server.
#We then check to see if the user input is 3 for quiting
#Then server received this and send the word 'quit' back
#to us so that we can terminate our keyboard input loop.

while lines_to_send = gets

server.puts(lines_to_send.chomp)


server.waitfor(/./) do |data|
puts data
exit = 3 if data =~ /quit/

end

break if exit == 3
end#end whileloop
