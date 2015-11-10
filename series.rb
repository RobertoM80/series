

class Series 
  attr_accessor :work_sequence

  def initialize sequence
    @sequence = sequence
    @work_sequence = sequence.split("").map {|num| num.to_i}
  end

  def slices slice_length
    result = []
    
    check_if_valid slice_length
   
    if slice_length == 1
      slice_one result
    else
      slice_more(slice_length, result)
    end
    result
  end
  
  def slice_one result
    work_sequence.each do |num| 
      result << [num]
    end
  end

  def slice_more slice_length, result
    while work_sequence.length != 0 do
      slice = work_sequence.slice(0..(slice_length - 1))
      result << slice if slice.length == slice_length
      work_sequence.shift
    end
  end

  def check_if_valid slice_length
    raise ArgumentError, "Slice is to Big" if slice_length >  work_sequence.length  
  end
end