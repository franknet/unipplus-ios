
Pod::Spec.new do |s|
  s.name             = 'UNIPPlusCore'
  s.version          = '0.1.0'
  s.summary          = 'UNIP Plus core dependencies'
  s.description      = <<-DESC
  UNIP Plus core dependency and features
                         DESC

  s.homepage         = 'https://github.com/franknet/unipplus-ios.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'franknet' => 'franklinsilvaalves@gmail.com' }
  s.source           = {
                          :git => 'https://github.com/franknet/unipplus-ios.git',
                          :tag => 'CocoaPods-' + s.version.to_s
                        }
  s.ios.deployment_target = '9.0'

  s.source_files = 'UNIPPlusCore/UNIPPlusCore/Classes/**/*'
end
