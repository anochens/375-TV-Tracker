class Search < ActiveRecord::Base

   def self.search(query)
        return {'size' => 0} if query.nil? || query.empty?
        results = {}
        results['size'] = 0

      tmp = Episode.find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
        if !tmp.nil?
            results['episodes'] = tmp
            results['size'] += tmp.size
        end

      tmp = SeriesItem.find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
        if !tmp.nil?
            results['series'] = tmp
            results['size'] += tmp.size
        end
 
#      tmp = Season.find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
#        if !tmp.nil?
#            results['seasons'] = tmp
#            results['size'] += tmp.size
#        end
#      tmp = SeriesItems.find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
#        if !tmp.nil?
#            results['series_items'] = tmp
#            results['size'] += tmp.size
#        end
#
#
#      tmp = Category.find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
#      tmp1 = Subcategory.find(:all, :conditions => ['name LIKE ?', "%#{query}%"])
#        results['categories'] = tmp unless tmp.nil?
#        if !tmp.nil?
#            results['categories'] = tmp
#            results['categories'] += tmp1
#            results['size'] += tmp.size
#            results['size'] += tmp1.size
#        end

        results['query'] = query;
        return results
    end
end
