# our previous subclassing example
class Point
    attr_accessor :x, :y # defines methods x, y, x=, y=

    def initialize (a,b)
        @x = a
        @y = b
    end

    def distFromOrigin
        Math.sqrt(@x * @x + @y * @y) # uses instance variables
    end

    def distFromOrigin2
        Math.sqrt(x * x + y * y) # uses getter methods
    end
end

class ColorPoint < Point
    attr_accessor :color # color color=

    def initialize(x,y,c="clear")
        super(x,y) # keyword super calls same method in superclass
        @color = c
    end
end


# ---------- Other ways instead of subclassing ----------

# instead of creating ColorPoint, add methods to Point
# cons: requires every Point to have those methods even if they will not use them
class Point
    attr_accessor :color # color color=

    def initialize(x,y,c="clear")
        @x = x
        @y = y
        @color = c
    end
end


# instead of subclassing, could copy/paste methods
# cons: no code reuse
class ColorPoint
    attr_accessor :x, :y, :color # defines methods x, y, x=, y=

    def initialize(x,y,c="clear")
        @x = x
        @y = y
        @color = c
    end

    def distFromOrigin
        Math.sqrt(@x * @x + @y * @y) # uses instance variables
    end

    def distFromOrigin2
        Math.sqrt(x * x + y * y) # uses getter methods
    end
end


# instead of subclassing Point, could use a Point instance variable
# pros: good style when avoiding subclassing,
#       programmers often overuse subclassing
# cons: ColorPoint is not is_a? of a Point anymore
#       even if you use an instance variable of a Point inside its body
class ColorPoint
    attr_accessor :color
    def initialize(x,y,c="clear")
        @pt = Point.new(x,y)
        @color = c
    end

    def x
        @pt.x
    end
    # similar "forwarding" method
    # for y, x=, y=
end