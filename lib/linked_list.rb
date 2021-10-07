class LinkedList
  attr_reader :head,
              :count

  def initialize
    @head  = nil
    @count = 0
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      @head.append_data(data)
    end
    @count += 1
  end

  def to_string
    @head.to_string
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      next_node = @head
      @head = Node.new(data)
      @head.append_node(next_node)
    end
    @count += 1
  end

  def insert(position, data)
    current = @head
    (position - 1).times do
      current = current.next_node
    end
    next_node = current.next_node

    node = Node.new(data)
    node.append_node(next_node)

    current.append_node(node)
  end

  def find(position, length)
    @head.find(position, length)
  end

  def includes?(data)
    @head.includes?(data)
  end
end
