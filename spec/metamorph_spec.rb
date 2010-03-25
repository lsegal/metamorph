describe "Metamorph" do
  it "should allow mixins to override methods defined directly in a class" do
    require_relative '../lib/metamorph'

    class X
      def x; "X" end
    end

    module Y
      def x; super + "Y" end
    end

    X.new.x.should == "X"
    class X; include Y end
    X.new.x.should == "XY"
  end
  
  it "should keep instance state" do
    class A
      def initialize; @a = 1 end
    end
    class B < A
      def foo; @a end
    end
    module C
      def foo; super + 1 end
    end
    B.new.foo.should == 1
    class B; include C end
    B.new.foo.should == 2
  end
  
  it "should put methods in InstanceMethods module" do
    class ABC
      def foo; "foo" end
    end
    
    ABC::InstanceMethods.instance_methods.should == [:foo]
    
    module DEF
      def foo; super + "bar" end
    end
    
    ABC.send(:include, DEF)
    ABC.new.foo.should == "foobar"  
  end
end