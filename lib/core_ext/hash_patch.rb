class Hash
  def tl_symbolize_keys
    inject({ }) do |options, (key, value)|
      new_key = case key
      when String
        Integer(key) rescue key.to_sym
      end
      
      new_value = case value
      when Hash then value.tl_symbolize_keys
      when String
        Integer(value) rescue value
      else value
      end
      
      options[new_key] = new_value
      options
    end
  end

  def tl_symbolize_keys!
    self.replace(self.tl_symbolize_keys)
  end
end
