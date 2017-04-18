# str = File.open('todo.txt'){ |file| file.read }
str=Marshal.load (IO.read "todo.txt")
  # @str = { "1. жить"=>18000, "2. поспим"=>28800, "3. умываться"=>420 }
  # str.each { |key, value| str[key] = 3 }
  # # if @n == 0                      
  # #   @n = @t + @time                 #end time of action
  # # else
  # #   @n = @time2+@time
  # # end
  puts str