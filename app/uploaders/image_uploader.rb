require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :processing
  plugin :versions, names: [:original, :small, :profile, :job_card]
  plugin :delete_raw
  plugin :determine_mime_type

  process(:store) do |io, context|
    original = io.download
    pipeline = ImageProcessing::MiniMagick.source(original)

    size_65 = pipeline.resize_to_limit!(65, 65)
    size_150 = pipeline.resize_to_limit!(150, 150)
    size_300 = pipeline.resize_to_limit!(300, 300)

    original.close!

    { original: io, small: size_300, profile: size_150, job_card: size_65 }
  end
end
