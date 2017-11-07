module TwitsHelper
    def render_with_hashtags(message)
        message.gsub(/#\w+/) { |word| link_to word, "/twits/hashtag/#{word.delete('#').downcase}"}.html_safe
    end
end
