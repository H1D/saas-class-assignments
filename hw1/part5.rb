class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # make sure it's a string
    attr_reader attr_name  # create the attribute's
    attr_reader attr_name+"_history" # create bar_history
    class_eval %Q{
                def %{n}=(new_value)
                  if !@%{n}_history
                    @%{n}_history = []
                    @%{n}_history << @%{n}
                  end
                  @%{n} = new_value
                  @%{n}_history << @%{n}
                end
               }%{:n => attr_name }
  end
end

class Foo
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

#f = Foo.new
#f.bar = 1
#f.bar = 2
#f.foo = 2
#p f.bar_history # => if your code works, should be [nil,1,2]
#p f.foo_history # => if your code works, should be [nil,1,2]