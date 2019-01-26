module SessionsHelper
  def flash_message
    unless flash.empty?
      result = ""
      flash.each do |name, msg|
        result += content_tag :p, msg, class: "flash flash-#{name}"
      end
      render inline: result
    end
  end
end
