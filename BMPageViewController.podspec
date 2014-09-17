Pod::Spec.new do |s|
  s.name         = "BMPageViewController"
  s.version      = "1.0.0"
  s.summary      = "Create UIPageViewControllers using storyboards."
  s.homepage     = "https://github.com/bmobileit/BMPageViewController"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Rogerio Araujo" => "rogerio@bmobile.net.br" }
  
  s.source       = { :git => "https://github.com/bmobileit/BMPageViewController.git", :tag => s.version.to_s }
  s.platform     = :ios, '6.0'
  s.source_files = 'BMPageViewController/Source/*.{h,m}'
  s.requires_arc = true
  s.ios.frameworks = 'UIKit', 'QuartzCore'
end