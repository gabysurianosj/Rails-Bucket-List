module ApplicationHelper
  def alphebetize(collection)
    case when collection.first.class == Trip
      collection.sort_by { |t| t.title }
    else
      collection.sort_by { |t| t.name }
    end
  end
end
