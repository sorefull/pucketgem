require 'packetgen'
require 'pry'
require "awesome_print"

# http://biot.com/capstats/bpf.html BPF syntax filter
loop do
  PacketGen.capture(iface: 'lo', filter: 'ip dst 127.0.0.1 and ip src 127.0.0.1') do |packet|
    # do_stuffs_with_packet
    ap packet
  end
end
