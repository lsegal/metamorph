# Metamorph

Transparently defines instance methods inside anonymous module so mixins can 
override them with proper inheritance. This allows a user to extend any class
with modules and override default behaviour without resorting to `alias_method_chain`,
even if the class defines the methods directly in the class body.

## Usage

Metamorph requires no special syntax or modification to source. Simply require
the library and all methods will be transparently redefined inside inner
modules.

    require 'metamorph'
    
    class A
      def foo; "foo" end
    end
    
    A::InstanceMethods.instance_methods # => [:foo]
    
    module B
      def foo; super + "bar" end
    end
    
    A.new.foo # => "foo"
    A.send(:include, B)
    A.new.foo # => "foobar"

Without `metamorph`, the second `A.new.foo` would still return "foo", because
the definition of `foo` directly in the A class body takes precedence over
any modules mixed in afterwards. Metamorph transparently changes this inheritance
rule to prioritize the "last" define method.

## Installing

1. Install the gem:

        sudo gem install metamorph

2. Build manually:

        rake build
        gem build metamorph.gemspec
        sudo gem install metamorph-VERSION.gem
    
## Known Issues

Metamorph does not play well with codebases that perform a lot of 
metaprogramming. Make sure to load metamorph *after* these libraries are
loaded.