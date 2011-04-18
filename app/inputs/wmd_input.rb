class WmdInput < Formtastic::Inputs::StringTextInput
  def to_html
    puts "this is my modified version of StringTextInput"
    super
  end
end