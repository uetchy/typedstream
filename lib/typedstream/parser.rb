# coding: utf-8

class Typedstream::Parser
  def initialize(data)
    @data = data.force_encoding('utf-8')
  end

  def self.parse(data)
    new(data).parse
  end

  def parse
    buffer = ''
    cursor = 0
    objects = []
    value = nil
    while(cursor < @data.size)
      buffer += @data[cursor]
      case buffer
      when "\x04\x0B\x73\x74\x72\x65\x61\x6D\x74\x79\x70\x65\x64\x81\xE8\x03\x84\x01\x40\x84"
        # Header
        buffer = ''
      when "\x84\x84"
        # Object
        len = @data[cursor+1].bytes[0]
        objects << @data[cursor+2, len]
        buffer = ''
        cursor += len+2
      when "\x85\x84\x01"
        # Value
        kind = @data[cursor+1]
        case kind
        when "\x2a" # Number
          type = @data[cursor+5]
          if @data[cursor+7] == "\x81"
            # Little-endian format
            value = @data[cursor+8, @data.size - (cursor+8)].unpack("S*")[0]
          else
            value = @data[cursor+7, @data.size - (cursor+7)].bytes[0]
          end
        when "\x2b" # String
          len = @data[cursor+2, 1].bytes[0]
          value = @data[cursor+3, len]
          break
        when "\x69" # Array
          type = @data[cursor+5]
          value = @data[cursor+6] || []
          puts "#{objects.first} -> #{value}"
        end
        buffer = ''
      end

      cursor += 1
    end

    return value
  end
end
