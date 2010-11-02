class TypeCastingToBool
  
  def normal_result
    Object.new && nil
  end
  
  def type_casted_result
    !!(Object.new && nil)
  end
  
  def shortened_if
    Object.new && nil ? false : true
  end
  
end

require 'benchmark'

n = 1_000_000
Benchmark.bmbm do |x|
  x.report("my_normal_choice (if)") { 
    n.times do
      if (TypeCastingToBool.new.normal_result)
        #"x"
      end 
    end 
  }
  x.report("with_bool_typecasting (if)") { 
    n.times do
      if (TypeCastingToBool.new.type_casted_result)
        #"x"
      end 
    end 
  }
  x.report("shortened_if (if)") { 
    n.times do
      if (TypeCastingToBool.new.shortened_if)
        #"x"
      end 
    end 
  }
    
  x.report("my_normal_choice (unless)") { 
    n.times do
      unless (TypeCastingToBool.new.normal_result)
        #"x"
      end 
    end 
  }
  x.report("with_bool_typecasting (unless)")   { 
    n.times do
      unless (TypeCastingToBool.new.type_casted_result)
        #"x"
      end 
    end 
  }
  x.report("shortened_if (unless)") { 
    n.times do
      unless (TypeCastingToBool.new.shortened_if)
        #"x"
      end 
    end 
  }
end
