module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Historiarenato"      
    end
  end
end
