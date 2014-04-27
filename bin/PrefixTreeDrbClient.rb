require 'drb/drb'

# The URI to connect to
SERVER_URI="druby://localhost:8788"

DRb.start_service

prefixServer = DRbObject.new_with_uri(SERVER_URI)

puts prefixServer.contains('hello')
puts prefixServer.contains('help')

puts prefixServer.find('hel')