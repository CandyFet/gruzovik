if defined?(BetterErrors) && Rails.env.development?
  BetterErrors.editor='x-mine://open?file=%{file}&line=%{line}'
end