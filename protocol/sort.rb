module Protocol
  module Sort

    def sort_by_id_in_array(items, array)
      items.sort_by {|item| array.index(item[:id]).to_i  }
    end
    
  end
end
