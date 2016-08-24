#
# simple knife.rb for running chef-zero locally
#
require 'tmpdir'

tmpdir = File.join(Dir.tmpdir, 'chefzero_simple')

file_cache_path File.join(tmpdir, 'cache')
node_path       File.join(tmpdir, 'nodes')
cookbook_path   File.join(tmpdir, 'berks-cookbooks')
