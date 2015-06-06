require "json"

module Mime

  def self.from_ext(ext)
    ext = ext.to_s
    return nil unless map[:types].has_key? ext
    map[:types][ext]
  end

  def self.to_ext(mime)
    return nil unless map[:extensions].has_key? mime
    map[:extensions][mime]
  end


  private def self.map
    @@map ||= begin
      types = {} of String => String
      extensions = {} of String => String
      type_defs = File.read(File.join(__DIR__, "types.json"))

      (JSON.parse(type_defs) as Hash(String, JSON::Type)).each do |type, exts|
        (exts as Array).each do |ext|
          ext = ext as String
          types[ext] = type
          extensions[type] = ext unless extensions.has_key? type
        end
      end

      { :types => types, :extensions => extensions }
    end
  end
end
