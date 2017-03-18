#!/usr/bin/env ruby

class Run
load 'lib/robot.rb'
  
  @@HELP_TEXT = false

  def initialize
    start
  end

  def start
    printn "Hello! im the robot"

    matrix_input_value = room_matrix
    start_input_value = start_at
    movement_input_value = walk

    robot = Robot.new(matrix_input_value, start_input_value, movement_input_value[0])

    printn ""
    print "#{robot.report}\n\n"
  end

  private

  def room_matrix
    printn "Im a simple robot that can walk around in a room with a matrix.
    The input consists of two values that tells the robot how big the room is. 
    For example: 5 7"

    input_options = {text: "Input", input_types: [Integer, Integer]}
    matrix_input_value = user_input(input_options)

    printn "That the floor matrix has #{matrix_input_value[0]} width and #{matrix_input_value[1]} squares in depth" if matrix_input_value

    matrix_input_value
  end

  def start_at
    printn "Place your robot in the matrix. For example: 3 3 N"

    input_options = {text: "Input", input_types: [Integer, Integer, String]}
    start_input_value = user_input(input_options)

    printn "The robot starts in square (#{start_input_value[0]},#{start_input_value[1]}) and is turned to the #{start_input_value[2]}." if start_input_value

    start_input_value
  end

  def walk
    printn "The robot takes commands in the form of characters. There are three commands:
    L - Turn left
    R - Turn right
    F - Go forward"

    input_options = {text: "Input", input_types: [String]}
    movement_input_value = user_input(input_options)

    movement_input_value
  end

  def user_input(options = {})
    user_input = ask_for_input(options[:text])

    if validate_input(user_input, options)
     return user_input
    else
      abort "\nYour input value is not allowed, Your robot is now stupid -> http://gph.is/1MUHsIC\n\n"
    end
  end

  def ask_for_input(text)
    print "#{text}:" if @@HELP_TEXT

    input = gets.chomp
    value = input.upcase.squeeze(' ').strip.split

    value
  end

  def validate_input(input, options = {})
    return false if input.length != options[:input_types].length

    input.each_with_index do |input_value, index|
      class_type = is_int?(input_value) ? Integer : input_value.class

      unless class_type == options[:input_types][index]
        return false
      end
    end

    true
  end

  def is_int?(value)
    class_type = Integer(value) rescue nil
    class_type == nil ? false : true
  end

  def printn(text)
    print "#{text}\n" if @@HELP_TEXT
  end
end

launcher = Run.new