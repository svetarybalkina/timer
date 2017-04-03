@t = Time.now
@schedule = {}
@ordnum = 1
@n = 0

def action

	puts "Что будем делать?"
	dejstv = gets.chomp
		act = @ordnum.to_s + ". " + dejstv

	puts "Как долго будем #{dejstv}? (в минутах)"
	@time = gets.chomp.to_i*60

	if @n == 0
		@n = @t + @time #время окончания
	else
		@n = @time2+@time
	end
		@schedule[act] = @n

	output = File.open "todo.txt", "a"
	output.write @schedule
	output.close

end
	
loop do
	puts 7.chr
	action
	@time2 = @n
	
	@ordnum += 1
	puts "Продолжить? Enter, если 'Да', любой другой символ + Enter, если закончили."
	b = gets.chomp

	if b == ""
		puts "Расписание составлено: "
		puts @schedule
		exit
	end

	# input = File.open "todo.txt", "r"
	# while (line = input.gets)
	# 	puts line
	# end
end