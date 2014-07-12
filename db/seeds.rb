# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


inserts = []

File.open("db/data", "r").each_line do |line|
  desa = line[27..52].strip.gsub("'", "''")
  kelurahan_id = line[53..59].strip
  tps_id = line[60..63].strip
  inserts.push("('#{desa}', '#{kelurahan_id}' , '#{tps_id}')")
end

CONN = ActiveRecord::Base.connection

puts "Inserting TPS data"
slices = inserts.each_slice(100).to_a
slices.each do |slice|
  sql = "INSERT INTO tps(desa, kelurahan_id, tps_id) VALUES #{slice.join(',')}"
  CONN.execute(sql)
end
puts "Inserted TPS data"