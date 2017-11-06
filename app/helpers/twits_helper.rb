module TwitsHelper
    def render_with_hashtags(message)
        message.gsub(/#\w+/) { |word| link_to word, "/twits/hashtag/#{word.delete('#')}"}.html_safe
    end
end