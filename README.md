# ChefzeroSimple

Add a rake task to facilitate running chef-zero locally on an unmanaged node. 
For example, it can be used to bootstrap a developer workstation, or a single 
VirtualBox VM.

* This gem should not be used for managed nodes! Use chef server.
* This gem should not be used for testing! Use test kitchen.

## Prerequisites

* Your project must use Berkshelf to manage cookbook dependencies
* ChefDK must be installed
* sudo

## Installation

Add this line to your chef cookbook's Gemfile:

```ruby
gem "chefzero_simple", :git => "https://github.com/christopherdeutsch/chefzero_simple.git"
```

And then execute:

```
$ chef exec bundle install
```

## Usage

1. First make sure you've followed the instructions under Installation (above), and have 
Added the gem to your `Gemfile` and run `chef exec bundle install`. This will make
the gem available from within your chef run.

2. Create chef attributes JSON file

Create a file in your project's root directory called 'zero.json' which contains any
chef attributes you wish to set for the chef-zero run. At a minimum just
set the runlist. For example:

```
{
    "run_list": [ "recipe[devbox::default]" ]
}
```

3. Add rake task

Add the following to your Rakefile to include the rake task:

```
require 'chefzero_simple/rake/task'
```

4. Run the rake task

```
chef exec rake chefzero_simple
```

## Optional: Customizing rake task options

The syntax for the rake task is:

```
$ rake chefzero_simple[ <use_sudo>, <json_attribute_file_name> ]
```

For example, to run chef-client with sudo and use the JSON attribute file
`custom.json`:

```
$ rake chefzero_simple[true,custom.json]
```

You can also customize the options passed to the rake task in your own
Rakefile. For example:

```ruby
desc "install developer workstation packages"
task :install
  Rake::Task[:chefzero_simple].invoke(true, 'custom.json')
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ispeakdeutsch/chefzero_simple.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

