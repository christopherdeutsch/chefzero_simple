#
# Rake task for simply running chef-zero locally, using Berkshelf
#
# Syntax: Rake::Task[:local_chefzero].invoke(<use_sudo>, <attr_json_file_name>)
#
# Example:
#   Use sudo and the default 'zero.json' attribute file:
#     Rake::Task[:local_chefzero].invoke
#
#   Use sudo and a custom json attribute file name:
#     Rake::Task[:local_chefzero].invoke(true, 'custom.json')
#
require 'tmpdir'

desc "run chef-zero simply using Berkshelf"
task :chefzero_simple, [:sudo, :json] do |t,args|
  dir = File.absolute_path(File.dirname(__FILE__))
  tmpdir = Dir.tmpdir

  #
  # potential race condition, but value speed of
  # vendoring over security in this case
  #
  localrunner_dir = File.join(tmpdir, 'chefzero_simple')
  berks_dir = File.join(localrunner_dir, 'berks-cookbooks')

  Dir.mkdir(localrunner_dir) unless Dir.exists? localrunner_dir

  %w(cache nodes).each do |d|
    dir_full_path = File.join(localrunner_dir, d)
    Dir.mkdir(dir_full_path) unless Dir.exists? dir_full_path
  end

  json_attrs = args[:json] || 'zero.json'
  use_sudo   = args[:sudo] || true

  chef_opts = ['-z']
  chef_opts << "-j #{json_attrs}"
  chef_opts << "-c #{File.join(dir, 'zero.rb')}"

  sh "#{use_sudo ? "sudo " : ""}chef exec berks vendor #{berks_dir}"
  sh "#{use_sudo ? "sudo " : ""}chef exec chef-client #{chef_opts.join(' ')}"
end
