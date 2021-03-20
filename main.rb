require_relative "lib/question"
require "rexml/document"
require "timeout"

NUMBER_OF_QUESTIONS = 5

file_path = File.join(__dir__,"data", "questions.xml")

doc = REXML::Document.new(File.read(file_path))

questions = doc.get_elements("questions/question").map do |xml_node|
  Question.from_xml_node(xml_node)
end

right_answers = 0
score = 0

questions.sample(NUMBER_OF_QUESTIONS).each do |question|
  puts "#{question.text} (баллов: #{question.points}) (времени на ответ: #{question.time} сек.)"
  question.answers.each_with_index do |answer, index|
    puts "#{index + 1}. #{answer}"
  end

  input =
    Timeout::timeout(question.time) do
      STDIN.gets.to_i
    end

  if question.right_answer?(input - 1)
    score += question.points
    right_answers += 1
    puts "Ответ верный!"
  else
    puts "Ответ не верный, верный ответ: #{question.right_answer}"
  end

rescue Timeout::Error
  puts "Время вышло"
  break
end

puts "Вы ответили правильно на вопросов: #{right_answers} из #{NUMBER_OF_QUESTIONS} и набрали баллов: #{score}."
