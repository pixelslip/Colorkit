Pod::Spec.new do |s|
  s.name             = "Colorkit"
  s.version          = "0.1.0"
  s.summary          = "A library to manipulate colors easily"

  s.homepage         = "https://github.com/pixelslip/Colorkit"
  s.license          = 'MIT'
  s.author           = { "pixelslip" => "pixelslip@gmail.com" }
  s.source           = { :git => "https://github.com/pixelslip/Colorkit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/pixelslip'

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = '*.{h,m}'
end
