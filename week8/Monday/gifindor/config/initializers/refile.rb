require "refile/s3"

aws = {
  access_key_id: ENV['aws_key'],
  secret_access_key: ENV['aws_secret'],
  region: "us-east-1",
  bucket: "tiy-indy-0216",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)

# make attachment_field behave like a normal input type so we get nice wrapper and labels
# <%= f.input :cover_image, as: :attachment, direct: true, presigned: true %>
module SimpleForm
  module Inputs
    class AttachmentInput < Base
      def input(wrapper_options = nil)
        refile_options = [:presigned, :direct, :multiple]
        merged_input_options = merge_wrapper_options(input_options.slice(*refile_options).merge(input_html_options), wrapper_options)
        @builder.attachment_field(attribute_name, merged_input_options)
      end
    end
  end
end

SimpleForm::FormBuilder.class_eval do
  map_type :attachment, to: SimpleForm::Inputs::AttachmentInput
end
