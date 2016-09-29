class TodoList

  def initialize(list)
    @list = list
  end

  def get_items
    @list
  end

  def add_item(item)
    @list << item
  end

  def delete_item(item)
    @list.each do |todo|
      if todo == item
        match = @list.index(item)
        @list.delete_at(match)
      end
    end
  end

  def get_item(index)
    @list[index]
  end

end