module SessionsHelper
  def flash_message
    unless flash.empty?
      messages = flash.reduce("") do |acc, (name, msg)|
        acc += content_tag :p, msg, class: "flash flash-#{name}"
      end
      messages.html_safe
    end
  end
end
