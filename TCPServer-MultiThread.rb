require 'socket'

def download_file(connection)
connection.puts "You enter number: 1"
end

def upload_file(connection)
connection.puts "You enter number: 2"
end

def display_main_menu(connection)
connection.puts "1. Download File"
#connection.puts "\^M\^J"
connection.puts "2. Upload File"
#connection.puts "\^M\^J"
connection.puts "3. Exit"
#connection.puts "\^M\^J"
end

server = TCPServer.new(7000)

loop do

Thread.start(server.accept) do |connection|

#display_main_menu(connection)

while line = connection.gets
#break if line =~ /quit/
puts line
display_main_menu(connection)

selection = case line.chomp

when "1" then download_file(connection)
when "2" then upload_file(connection)
when "3" then connection.puts "quit"
else connection.puts "Enter your choice"
end#case statement

end

connection.puts "Closing the connection. Bye!"
connection.close
end

end
