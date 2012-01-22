TruncateHtml.configure do |config|
  config.length       = 1000
  config.omission     = '...'
  config.word_boundary = true
end