require 'packetgen'
require 'pry'
require "awesome_print"

1.times do
  packet = PacketGen.gen('TCP', src: '127.0.0.1', dst: '127.0.0.1', port: 80)
  packet.to_w('lo')

  ap packet
  # binding.pry
end
