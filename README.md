# ChefzeroSimple

Add a rake task to facilitate running chef-zero locally on an unmanaged node. 
For example, it can be used to bootstrap a developer workstation, or a single 
VirtualBox VM.

* This gem should not be used for managed nodes! Use chef server.
* This gem should not be used for testing! Use test kitchen.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chefzero_simple'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chefzero_simple

## Prerequisites

* Your project must use Berkshelf to manage cookbook dependencies
* ChefDK must be installed
* sudo (optional)

## Usage

1. Create chef attributes JSON file

Create a file in your project called 'zero.json' which contains any
chef attributes you wish to set for the chef-zero run. At a minimum just
set the runlist. For example:

```
{
    "run_list": [ "recipe[devbox::default]" ]
}
```

2. Add rake task

Add the following to your Rakefile:

```
require 'chefzero_simple/rake/task'
```

3. Run rake task

```
rake chefzero_simple
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

```
desc "install developer workstation packages"
task :install
  Rake::Task[:chefzero_simple].invoke(true, 'custom.json')
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ispeakdeutsch/chefzero_simple.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

