file = File.open('data/data.txt')
file_data = file.readlines.map(&:chomp)
$count_within = 0
$count_partial = 0

# Solution for part 1
def range_partially_within_other(num1_start, num1_end, num2_start, num2_end)
  if (num1_start <= num2_end) & (num1_end >= num2_start) or (num2_start <= num1_end) & (num2_end >= num1_start)
    $count_partial += 1
  end
  $count_partial
end

#Solution for part 2
def range_fully_within_other(num1_start, num1_end, num2_start, num2_end)
  if (num1_start >= num2_start) & (num1_end <= num2_end) or (num2_start >= num1_start) & (num2_end <= num1_end)
    $count_within += 1
  end
  $count_within
end


# main loop
file_data.each do |ele|
  ele =  ele.split(",")
  x1 = ele.first.split("-").first.to_i
  x2 = ele.first.split("-").last.to_i
  y1 = ele.last.split("-").first.to_i
  y2 = ele.last.split("-").last.to_i

  range_fully_within_other(x1, x2, y1, y2)
  range_partially_within_other(x1, x2, y1, y2)
end

puts $count_within
puts $count_partial
