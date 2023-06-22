class MyRational
    def initialize (num, den=1)
        if den == 0
            raise "MyRational received an inappropriate argument"
        elsif den < 0
            @num = - num
            @den = - den
        else
            @num = num
            @den = den
        end # notice end for every if else statements
        reduce # i.e., self.reduce() but private
    end

    # different toString methods
    def to_s
        ans = @num.to_s
        if @den != 1
            ans += "/"
            ans += @den.to_s
        end
        ans
    end

    def to_s2
        dens = ""
        dens = "/" + @den.to_s if @den != 1 # funny if syntax
        @num.to_s + dens
    end

    def to_s3 # using things like Racket's quasiquote and unquote, JS `${}`
        "#{@num}#{if @den == 1 then "" else "/" + @den.to_s end}"
    end

    # imperative method of add!
    def add! # mutate self in-place
        a = r.num # only works b/c of protected methods below
        b = r.den # only works b/c of protected methods below
        c = @num
        d = @dens
        @num = (a * d) + (b * c)
        @den = b * d
        reduce
        self # convenient for stringing calls
    end

    # a functional addition, so we can write r1.+ r2 to make a new rational
    # and built-in syntactic sugar will work: can write r1 + r2
    def + r
        ans = MyRational.new(@num, @den)
        ans.add! r
        ans
    end

    protected
    # there is very common sugar for this (attr_reader)
    # the better way:
    # attr_reader :num, :den
    # protected :num, :den
    # we do not want these methods public
    # but we cannot make them private
    # because of the add! method above
    def num
        @num
    end

    def den
        @den
    end

    private
    def gcd (x,y)
        if x == y
            x
        elsif x < y
            gcd (x, y-x)
        else
            gcd (y, x)
        end
    end

    def reduce 
        if @num == 0
            @den = 1
        else
            d = gcd(@num.abs, @den) # notice method call on number
            @num = @num / d
            @den = @den / d
        end
    end

end

def use_rationals
    r1 = MyRational.new(3,4)
    r2 = r1 + r1 + MyRational.new(-5,2) # (r1.+(r2)).+ ....
    puts r2.to_s
    (r2.add! r1).add! (?MyRational.new(1, -4))
    puts r2.to_s
    puts r2.to_s2
    puts r2.to_s3
end