module Fit
  class File

    def self.read(io)
      new.read(io)
    end

    attr_reader :header, :records, :crc

    def initialize
      @records = []
    end

    def read(io)
      @header = Header.read(io)

      Record.clear_definitions!

      while io.pos < @header.end_pos
        puts "Record #{Record.read(io)}"
        @records << Record.read(io)
      end

      @crc = io.read(2)
      
      puts "CRC #{@crc}"

      self
    end

  end
end
