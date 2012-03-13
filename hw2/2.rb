class CartesianProduct
  include Enumerable

  def initialize(a,b)
    @a=a
    @b=b
  end

  def each
    @a.each{ 
    	|ao|    	
    	@b.each {
    		|bo|
    		 yield [ao,bo]
    		}
    	}

  end
end