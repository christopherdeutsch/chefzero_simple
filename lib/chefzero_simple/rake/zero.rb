#
# simple knife.rb for running chef-zero locally
#
dir = File.join(Dir.tmpdir, 'chefzero_simple')

file_cache_path File.join(dir, 'cache')
node_path       File.join(dir, 'nodes')
cookbook_path   File.join(dir, 'berks-cookbooks')
