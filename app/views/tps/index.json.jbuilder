json.array!(@tps) do |tp|
  json.extract! tp, :id, :desa, :kelurahan_id, :tps_id
  json.url tp_url(tp, format: :json)
end
