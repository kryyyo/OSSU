# GETTER
def foo
    @foo
end

# SETTER
def foo= x
    @foo = x
end
# using the setter
# e.foo = 42

# define getters and setters
attr_accessor :foo, :bar ...

# define getters only
attr_reader :foo, :bar ...

# why private object state? 
# security and ease of change
def celsius_temp= x
    @kelvin_temp = x + 273.15
end

# Use of visibility keywords: private, protected, and public
class Foo =
    # default: methods are public

    protected
    # now methods will be protected until the next visibility keyword

    public
    # 

    private
    # 
end
