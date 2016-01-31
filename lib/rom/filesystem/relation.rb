module ROM
  module Filesystem
    class Relation < ROM::Relation
      adapter :filesystem

      forward :select, :sort
    end
  end
end
