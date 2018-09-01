Pod::Spec.new do |s|
  s.name         = "WPPrintLogFile"
  s.version      = "0.0.1"
  s.summary      = "WPPrintLogFile"
  s.homepage     = "git@github.com:wenyhooo/WPPrintLogFile.git"
  s.license      = 'MIT'
  s.authors      = { "wenyhooo" => "871531334@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wenyhooo/WPPrintLogFile" ,:tag => s.version}
  s.source_files = 'WPPrintLogFile/*.{h,m,mm}'
  s.requires_arc = true
  s.frameworks = 'Foundation'
end
