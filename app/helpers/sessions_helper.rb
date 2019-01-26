module SessionsHelper
  def flash_message(name, msg)
      content_tag :p, msg, class: "flash flash-#{name}"
  end
end
