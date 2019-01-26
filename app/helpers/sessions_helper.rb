module SessionsHelper
  def flash_message(msg)
    if flash[msg]
      content_tag :p, flash[msg], class: "flash flash-#{msg}"
    end
  end
end
