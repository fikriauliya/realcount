json.array!(@crowd_inputs) do |crowd_input|
  json.extract! crowd_input, :id, :user_id, :tps_id, :prabowo_count, :jokowi_count, :broken_count, :problem
  json.url crowd_input_url(crowd_input, format: :json)
end
