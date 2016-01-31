require 'rom/filesystem/dataset'

module ROM
  module Filesystem
    class Gateway < ROM::Gateway
      def initialize(root)
        @root = File.absolute_path(root)
      end

      def dataset(name)
        Dataset.new(Dir.new("#{@root}/#{name}"))
      end

      def dataset?(name)
        Dir.exist?("#{@root}/#{name}")
      end
    end
  end
end
