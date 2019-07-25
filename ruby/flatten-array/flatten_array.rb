class FlattenArray

  def self.flatten(arr=[])
    arr.reduce([]) { |acc, item|
      case
        when item.nil?
          acc
        when item.kind_of?(Array)
          acc.push(*flatten(item))
        else
          acc.push(item)
      end
    }
  end

end
