require 'mini_magick'
require 'open-uri'

module MemeMaker
  class << self
    def generate(meme, header, subheader)
      file_name = "#{Time.now.to_i}.image"
      background_file = download_meme(meme, file_name)
      new_meme = resize(background_file)
      new_meme = add_text(new_meme, header, 'North')
      new_meme = add_text(new_meme, subheader, 'South')

      new_meme.write "output/#{file_name}.png"
      new_meme.path
    end

    def download_meme(meme_url, file_name)
      temp_file = File.expand_path("./temp/#{file_name}")
      File.open(temp_file, 'w+') do |fo|
        fo.write open(meme_url).read
      end

      temp_file
    end

    def add_text(image, text, gravity = 'Center')
      image.combine_options do |comp|
        comp.fill 'black'
        comp.pointsize '40'
        comp.font 'Impact'
        comp.weight '900'
        comp.gravity gravity
        comp.draw "text 9,9 '#{text}'"
        comp.fill 'black'
        comp.pointsize '40'
        comp.font 'Impact'
        comp.weight '900'
        comp.gravity gravity
        comp.draw "text 11,11 '#{text}'"
        comp.fill 'white'
        comp.pointsize '40'
        comp.font 'Impact'
        comp.weight '700'
        comp.gravity gravity
        comp.draw "text 10,10 '#{text}'"
      end

      image
    end

    def resize(temp_image_path)
      image = MiniMagick::Image.open(temp_image_path)
      image.resize "800"
      image.format "png"
    end
  end
end
