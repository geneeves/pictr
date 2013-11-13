Paperclip::Attachment.default_options[:url] = 'http://s3.amazonaws.com/pictr/photos'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'