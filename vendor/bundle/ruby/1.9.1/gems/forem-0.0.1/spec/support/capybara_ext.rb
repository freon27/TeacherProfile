module CapybaraExt
  # Just a shorter way of writing it.
  def assert_seen(text, opts={})
    if opts[:within]
      within(selector_for(opts[:within])) do
        page.should have_content(text)
      end
    else
      page.should have_content(text)
    end
  end
  
  def flash_error!(text)
    within("#flash_error") do
      assert_seen(text)
    end
  end
  
  def flash_notice!(text)
    within("#flash_notice") do
      assert_seen(text)
    end
  end
  
  def selector_for(identifier)
    case identifier
    when :topic_header
      "#topic h2"
    when :post_text
      "#posts .post .text"
    when :post_user
      "#posts .post .user"
    when :first_post
      "#posts #post_1"
    when :second_post
      "#posts #post_2"
    when :post_actions
      "#{selector_for(:first_post)} .actions"
    else
      pending "No selector defined for #{identifier}. Please define one in spec/support/capybara_ext.rb"
    end
  end
end

RSpec.configure do |config|
  config.include CapybaraExt
end