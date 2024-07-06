require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
    cloud_name: ENV["CLOUD_NAME"],
    api_key: ENV["API_KEY"],
    api_secret: ENV["API_SECRET"],
)

Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new(prefix: "project/cache"), # for direct uploads
    store: Shrine::Storage::Cloudinary.new(prefix: "project"),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :validation_helpers # validate cached attachment
Shrine.plugin :validation
Shrine.plugin :determine_mime_type
