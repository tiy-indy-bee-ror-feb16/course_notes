require "refile/s3"

aws = {
  access_key_id: ENV['aws_key'],
  secret_access_key: ENV['aws_secret'],
  region: "us-east-1",
  bucket: "tiy-indy-0216",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
