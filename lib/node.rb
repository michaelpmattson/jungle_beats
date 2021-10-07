class Node
  attr_reader :data,
              :next_node

  def initialize(data)
    @data      = data
    @next_node = nil
  end

  def append_data(data)
    if next_node.nil?
      @next_node = Node.new(data)
    else
      @next_node.append_data(data)
    end
  end

  def to_string
    string = @data
    unless next_node.nil?
      string = "#{string} #{next_node.to_string}"
    end
    string
  end

  def append_node(node)
    @next_node = node
  end

  def find(position, length)
    current = self
    position.times do
      current = current.next_node
    end

    last = current
    (length - 1).times do
      last = last.next_node
    end

    hold = last.next_node

    last.delete_next

    string = current.to_string

    last.append_node(hold)

    string
  end

  def delete_next
    @next_node = nil
  end

  def includes?(data)
    require "pry"; binding.pry
  end
end
