require "json"

module Mime

  def self.from_ext(ext)
    map[:types][ext]
  end

  def self.to_exts(mime)
    map[:extensions][mime]
  end


  private def self.map
    @@map ||= begin
      path = File.join(__DIR__, "..", ".deps", "broofa-node-mime", "types.json")

      unless File.exists?(path)
        raise "Unable to find type.json file. Ensure deps are installed"
      end

      types = {} of String => String
      extensions = {} of String => String

      json = File.read(path)
      data = JSON.parse(json) as Hash(String, JSON::Type)
      data.each do |type, exts|
        (exts as Array).each do |ext|
          ext = ext as String
          types[ext] = type
          extensions[type] = ext unless extensions.has_key? type
        end
      end

      puts "\n\nTYPES\n\n"
      puts types.inspect
      puts "\n\nEXTENSIONS\n\n"
      puts extensions.inspect

      { :types => types, :extensions => extensions }
    end
  end
end
