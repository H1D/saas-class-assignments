class Numeric
  @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019 }
  attr_accessor :currency

  def method_missing(method_id)
    if @currency == nil
      @currency = 'dollar'
    end
    currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(currency)
      res = (self*@@currencies[@currency]) * (@@currencies[@currency]/@@currencies[currency])
      res.currency = currency
      return res
    else
      super
    end
  end

  def in(to_currency)
    self.send(to_currency)
  end
end

class String
  def palindrome?()
    string = self.gsub(/\W/,'')
    string = string.upcase
    return string == string.reverse
  end
end

module Enumerable
  def palindrome?()
    if not self.kind_of? Hash      
      if self.respond_to? :reverse
        return self == self.reverse
      else
        arr = []
        self.each {|o| arr << o}
        return arr.palindrome?
      end
    else
      return true
    end
  end
end

p 5.rupees.yen