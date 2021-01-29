
Pod::Spec.new do |s|


  s.name         = "QRongIMSDK_UI"
  s.version      = "0.9.0"
  s.summary      = "RongCloud IM SDK.(如果看不到最新版本，请使用 pod repo update 命令更新一下本地pod仓库，从 2.9.0 版本开始这里不再包含 CallKit 和 CallLib 类库的管理，音视频服务升级为融云自有音视频，2.9.0 版本之前用户请根据站内信提示更新)"


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
    kit.resources = "RongIMKit/Resource/*.*"
    kit.source_files = 'RongIMKit/RongIMKit.h','RongIMKit/**/*.{h,m,c}'
    kit.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "SafariServices"
    kit.dependency 'RongCloudIM/IMLib','5.0.0'
  end

  s.subspec 'Sticker' do |rs|
  	rs.resources = "RongSticker/Resource/*.*"
    rs.source_files = 'RongSticker/RongSticker.h','RongSticker/**/*.{h,m,c}'
    rs.dependency 'QRongIMSDK_UI/IMKit'
  end

  s.subspec 'Sight' do |st|
    st.source_files = 'RongSight/RongSight.h','RongSight/**/*.{h,m}'
    st.dependency 'QRongIMSDK_UI/IMKit'
  end

  s.subspec 'IFly' do |fly|
    fly.libraries = "z"
    fly.frameworks = "AddressBook", "SystemConfiguration", "CoreTelephony", "CoreServices", "Contacts"
    fly.resources = "RongiFlyKit/Resource/*.*"
    fly.source_files = 'RongiFlyKit/RongiFlyKit.h','RongiFlyKit/**/*.{h,m}'
    fly.dependency 'QRongIMSDK_UI/IMKit'
    fly.vendored_frameworks = "RongiFlyKit/Engine/iflyMSC.framework"
  end

  s.subspec 'ContactCard' do |cc|
    cc.source_files = 'RongContactCard/RongContactCard.h','RongContactCard/**/*.{h,m,c}'
    cc.dependency 'QRongIMSDK_UI/IMKit'
  end

  s.subspec 'CallKit' do |ck|
    ck.source_files = 'RongCallKit/RongCallKit.h','RongCallKit/**/*.{h,m,mm}'
    ck.resources = "RongCallKit/Resources/*.*"
    ck.dependency 'QRongIMSDK_UI/IMKit'
    ck.dependency 'RongCloudRTC/RongCallLib','5.0.0'
  end

end
