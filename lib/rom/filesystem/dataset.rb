module ROM
  module Filesystem
    class Dataset
      def initialize(dir, select = ['*'], sort = false)
        @dir = dir
        @select = select
        @sort = sort
      end

      def select(*args)
        self.class.new(@dir, args, @sort)
      end

      def sort
        self.class.new(@dir, @select, true)
      end

      def each(&block)
        to_a.each(&block)
      end

      def to_a
        root = Pathname.new(@dir.path)
        paths = @select.map { |filter| "#{root}/#{filter}" }

        matches = Dir[*paths].reject { |f| f == '.' || f == '..' }
        matches = matches.sort if @sort

        matches.map { |filename| root.join(filename) }
      end
    end
  end
end
