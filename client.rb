require 'packetgen'
require 'pry'
require "awesome_print"
require 'optparse'

# INTERFACE = 'lo'
# PROTOCOL = 'ip'
# DST_IP = '127.0.0.1'
# SRC_IP = '127.0.0.1'

OptionParser.new do |parser|
  parser.banner = "Usage: rvmsudo ruby client.rb -i INTERFACE -p PROTOCOL -s SRC_IP -d DST_IP"

  parser.on('-i interface') do |interface|
    INTERFACE = interface
  end

  parser.on('-p protocol') do |protocol|
    PROTOCOL = protocol
  end

  parser.on('-s src') do |src|
    SRC_IP = src
  end

  parser.on('-d dst') do |dst|
    DST_IP = dst
  end
end.parse!

raise OptionParser::MissingArgument if INTERFACE.nil? || PROTOCOL.nil?  || SRC_IP.nil?  || DST_IP.nil?

# http://biot.com/capstats/bpf.html BPF syntax filter
filter = "#{PROTOCOL} dst #{DST_IP} and ip src #{SRC_IP}" if PROTOCOL == 'ip'
filter = "#{PROTOCOL} and dst port 80" if PROTOCOL == 'tcp'

loop do
  PacketGen.capture(iface: INTERFACE, filter: filter) do |packet|
    ap packet
  end
end
