require 'rom'

require 'rom/filesystem/version'
require 'rom/filesystem/gateway'
require 'rom/filesystem/relation'

ROM.register_adapter(:filesystem, ROM::Filesystem)
