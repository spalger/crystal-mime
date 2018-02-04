require "json"

module Mime
  def self.from_ext(ext)
    ext = ext.to_s
    map[:types][ext]?
  end

  def self.to_ext(mime)
    map[:extensions][mime]?
  end

  private def self.map
    @@map ||= begin
      types = {} of String => String
      extensions = {} of String => String
      type_defs = File.read(File.join(__DIR__, "types.json"))

      JSON.parse(type_defs).each do |type, exts|
        exts.each do |ext|
          types[ext.as_s] = type.as_s
          extensions[type.as_s] = ext.as_s unless extensions.has_key? type.as_s
        end
      end

      {:types => types, :extensions => extensions}
    end.as(Hash(Symbol, Hash(String, String)))
  end
end
