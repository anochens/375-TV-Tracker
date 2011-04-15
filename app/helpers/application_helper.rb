module ApplicationHelper
  def production?
      (ENV['RAILS_ENV']=='production')
  end
  
  def display_stars(stars)
    content_tag(:div, star_images(stars || 0).html_safe, :escape => false, :class => 'kcw_stars')
  end
  
  def star_images(stars)
    (0...5).map do |n|
      star_image_tag(((stars-n)*2).round)
    end.join
  end
  
  def star_image_tag(value)
    image_tag("/images/kcw_stars/#{star_image_name(value)}.gif", :size => '25x25')
  end
  
  def star_image_name(value)
    if value <= 0
      'kcw_empty_star'
    elsif value == 1
      'kcw_half_star'
    else
      'kcw_full_star'
    end
  end
end
