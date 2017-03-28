@t = Time.now
@schedule = {}
@ordnum = 1
@n = 0

def action

	puts "Что будем делать?"
	a = gets.chomp
		act = @ordnum.to_s + ". " + a

	puts "Как долго будем #{a}? (в минутах)"
	@time = gets.chomp.to_i*60

	if @n == 0
		@n = @t + @time #время окончания
	else
		@n = @time2+@time
	end
		@schedule[act] = @n

end
	
loop do
	action
	@time2 = @n
	
	@ordnum += 1
	puts "Продолжить? Enter, если 'Да', любой другой символ + Enter, если закончили."
	a = gets.chomp

	if a == ""
		puts "Расписание составлено: "
		puts @schedule
		exit
	end
end