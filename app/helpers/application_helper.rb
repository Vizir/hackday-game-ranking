module ApplicationHelper
  def parse_timeline_message (message)
    regex = "/@[a-z]*/"
    message.gsub(/@[a-z]*/){|match| link_to match, profile_path(match[1..-1])}
  end
end
