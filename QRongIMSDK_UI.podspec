
Pod::Spec.new do |s|


  s.name         = "QRongIMSDK_UI"
  s.version      = "1.1.1"
  s.summary      = "RongCloud UI SDK SourceCode."


  s.description  = <<-DESC
                   RongCloud IM SDK for iOS.
                   DESC


  s.homepage     = "https://github.com/loginSin"
  s.license      = { :type => "Copyright", :text => "Copyright 2021 loginSin" }
  s.author             = { "loginSin" => "https://github.com/loginSin" }
  s.social_media_url   = "loginSin"
  s.platform     = :ios, "8.0"
  # s.source       = { :http => "https://downloads.rongcloud.cn/QRongIM.zip" }
  s.source           = { :git => 'https://github.com/loginSin/QRongIMSDK_UI.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'IMKit' do |kit|
    kit.resources = "IMKit/Resource/*.*"
    kit.source_files = 'IMKit/RongIMKit.h','IMKit/**/*.{h,m,c}'
    kit.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "SafariServices"
    kit.dependency 'RongCloudIM/IMLib','5.0.0'
  end

  s.subspec 'RongSticker' do |rs|
  	rs.resources = "Sticker/Resource/*.*"
    rs.source_files = 'Sticker/RongSticker.h','Sticker/**/*.{h,m,c}'
    rs.dependency 'QRongIMSDK_UI/IMKit'
  end

  s.subspec 'Sight' do |st|
    st.source_files = 'Sight/RongSight.h','Sight/**/*.{h,m}'
    st.dependency 'QRongIMSDK_UI/IMKit'
  end

  s.subspec 'IFly' do |fly|
    fly.libraries = "z"
    fly.frameworks = "AddressBook", "SystemConfiguration", "CoreTelephony", "CoreServices", "Contacts"
    fly.resources = "iFlyKit/Resource/*.*"
    fly.source_files = 'iFlyKit/RongiFlyKit.h','iFlyKit/**/*.{h,m}'
    fly.dependency 'QRongIMSDK_UI/IMKit'
    fly.vendored_frameworks = "iFlyKit/Engine/iflyMSC.framework"
  end

  s.subspec 'ContactCard' do |cc|
    cc.source_files = 'ContactCard/RongContactCard.h','ContactCard/**/*.{h,m,c}'
    cc.dependency 'QRongIMSDK_UI/IMKit'
  end

  s.subspec 'RongCallKit' do |ck|
    ck.source_files = 'CallKit/RongCallKit.h','CallKit/**/*.{h,m,mm}'
    ck.resources = "CallKit/Resources/*.*"
    ck.dependency 'QRongIMSDK_UI/IMKit'
    ck.dependency 'RongCloudRTC/RongCallLib','5.0.0'
  end

end
