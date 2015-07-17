class LeafSearch < Searchlight::Search
  search_on Leaf

  searches :placement, :blade, :veins, :location, :date_found

  def search_placement
    search.where(placement: placement)
  end

  def search_blade
    search.where(blade: blade)
  end

  def search_veins
    search.where(veins: veins)
  end

  def search_location
    search.where(location: location)
  end

  def search_date_found
    search.where(date_found: date_found)
  end
end
