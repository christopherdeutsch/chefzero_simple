#
# simple knife.rb for running chef-zero locally
#
require 'tmpdir'

tmpdir = File.join(Dir.tmpdir, 'chefzero_simple')

STDERR.puts "chefzero_simple using temporary directory \"#{dir}\""

file_cache_path File.join(tmpdir, 'cache')
node_path       File.join(tmpdir, 'nodes')
cookbook_path   File.join(tmpdir, 'berks-cookbooks')
