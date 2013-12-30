#curl -X PUT localhost:4985/sync_gateway/_user/iCouchBlog --data '{"disabled":false, "admin_channels":["public"], "email":"icouch.blog@example.org", "password":"test"}'

require 'json'

user_id = '95efae7bdc1d456b1e79eddf291f0327'

count = 90000
uuids = JSON.parse(`curl -X GET http://127.0.0.1:5984/_uuids?count=#{count}`)["uuids"]
uuids.each_with_index do |uuid, idx|
  i = 100_000 - count + idx + 1

  post_json = {
    "body" => "body#{i}",
    "created_at" => "2013-12-29T21:00:40Z",
    "title" => "post#{i}",
    "type" => "post",
    "updated_at" => "2013-12-29T21:00:48Z",
    "user_id" => user_id,
    "channels" => ["public"]
  }.to_json

  `curl -X PUT -H "Content-Type: application/json" --user iCouchBlog:test http://localhost:4984/sync_gateway/#{uuid} -d '#{post_json}'`
end

