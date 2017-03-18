class Robot

  @@ABORT = true

  @@TURN_VALUE = 0 
  @@Y_AXIS = 0
  @@X_AXIS = 0

  @@Y_MATRIX = 0
  @@X_MATRIX = 0

  LEFT = "L"
  RIGHT = "R"
  FORWARD = "F"

  NORTH = "N"
  WEST = "W"
  EAST = "E"
  SOUTH = "S"

  def initialize(matrix, start, movement)
    @@X_AXIS = start[0].to_i
    @@Y_AXIS = start[1].to_i

    @@X_MATRIX = matrix[0].to_i
    @@Y_MATRIX = matrix[1].to_i

    start_turn_value(start[2])

    movement.split("").each do |direction|
      move(direction)
    end
  end

  def report
    return "Ouside the matrix - X:#{@@X_MATRIX} Y:#{@@Y_MATRIX}" if what_is_the_matrix

    "Report: #{@@X_AXIS} #{@@Y_AXIS} #{turn_to}"
  end

  private

  def what_is_the_matrix
    if ((@@Y_AXIS < 0 || @@X_AXIS < 0) || (@@Y_AXIS > @@Y_MATRIX || @@X_AXIS > @@X_MATRIX))
      if @@ABORT
        abort "\nYou take the blue pill, the story ends. 
You wake up in your bed and believe whatever you want to believe. 
You take the red pill, you stay in Wonderland, and I show you how deep the rabbit hole goes\n\n"
      else
        return true
      end
    end

    false
  end

  def move(direction)
    case direction
    when LEFT then turn_left
    when RIGHT then trun_right
    when FORWARD then go_forward
    end
  end

  def start_turn_value(start_value)
    @@TURN_VALUE = case start_value
    when NORTH then 0
    when EAST then 1
    when SOUTH then 2
    when WEST then 3
    else 
      0
    end
  end

  def go_forward
    case turn_to
    when NORTH then @@Y_AXIS = @@Y_AXIS+1
    when SOUTH then @@Y_AXIS = @@Y_AXIS-1
    when WEST then @@X_AXIS = @@X_AXIS-1
    when EAST then @@X_AXIS = @@X_AXIS+1
    end
  end

  def turn_left
    @@TURN_VALUE = @@TURN_VALUE-1
  end

  def trun_right
    @@TURN_VALUE = @@TURN_VALUE+1
  end

  def turn_to
    reset_turn_value

    case @@TURN_VALUE
    when 0  then NORTH
    when -1 then WEST
    when 3  then WEST
    when -2 then SOUTH
    when 2  then SOUTH
    when -3 then EAST
    when 1  then EAST
    end
  end

  def reset_turn_value
    @@TURN_VALUE = 0 if @@TURN_VALUE == 4 || @@TURN_VALUE == -4
  end
end