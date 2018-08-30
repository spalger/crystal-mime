require "baked_file_system"
require "json"

module Mime
  class MimeTypesStore
    extend BakedFileSystem
    bake_file "types.json", File.read("src/types.json")
  end

  def self.from_ext(ext)
    ext = ext.to_s
    map[:types][ext.to_s]?
  end

  def self.to_ext(mime)
    map[:extensions][mime]?
  end

  private def self.map
    @@map ||= begin
      types = {} of String => String
      extensions = {} of String => String

      Hash(String, Array(String)).from_json(MimeTypesStore.get("types.json")).each do |type, exts|
        exts.each do |ext|
          types[ext] = type
          extensions[type] = ext unless extensions.has_key? type
        end
      end

      {:types => types, :extensions => extensions}
    end.as(Hash(Symbol, Hash(String, String)))
  end
end
