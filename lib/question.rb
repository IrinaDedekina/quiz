class Question
  attr_reader :text, :answers, :right_answer, :points, :time

  def initialize(text:, answers:, right_answer:, points:, time:)
    @text = text
    @answers = answers
    @right_answer = right_answer
    @points = points.to_i
    @time = time.to_i
  end

  def self.from_xml_node(xml_node)
    text = xml_node.elements["text"].text
    answer_options = xml_node.get_elements("variants/variant")
    answers = answer_options.map(&:text)
    right_answer = answer_options.find { |node| node.attributes["right"] }.text
    points = xml_node.attributes["points"].to_i
    time = xml_node.attributes["seconds"].to_i

    new(
      text: text,
      answers: answers,
      right_answer: right_answer,
      points: points,
      time: time
    )
  end

  def right_answer?(answer_index)
    answers[answer_index] == right_answer
  end
end
