module ROM
  module Filesystem
    class Dataset
      def initialize(dir, options = {})
        @dir = dir
        @options = options

        @options[:select] ||= ['*']
      end

      def select(*args)
        self.class.new(@dir, @options.merge(select: args))
      end

      def sort
        self.class.new(@dir, @options.merge(sort: true))
      end

      def each(&block)
        to_a.each(&block)
      end

      def to_a
        root = Pathname.new(@dir.path)
        paths = @options[:select].map { |filter| "#{root}/#{filter}" }

        matches = Dir[*paths].reject { |f| f == '.' || f == '..' }
        matches = matches.sort if @options[:sort]

        matches.map do |filename|
          path = root.join(filename)

          {
            name: path.basename.to_s,
            path: path
          }
        end
      end
    end
  end
end
