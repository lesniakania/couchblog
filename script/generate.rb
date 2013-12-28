require 'json'

count = 62609
user_id = '95efae7bdc1d456b1e79eddf291f0327'
uuids = JSON.parse(`curl -X GET http://127.0.0.1:5984/_uuids?count=#{count}`)["uuids"]
uuids.each_with_index do |uuid, idx|
  i = 100_000 - count + idx + 1

  post_json = JSON.parse(`curl -X PUT http://127.0.0.1:5984/couchblog/#{uuid} -d '{"body":"body#{i}", "title":"post#{i}", "created_at":"2013-12-27T08:06:03.577Z", "updated_at":"2013-12-27T08:06:03.577Z", "type":"Post", "user_id": "#{user_id}"}'`)
end

