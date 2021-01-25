
Pod::Spec.new do |s|


  s.name         = "QRongIMSDK_UI"
  s.version      = "0.3.0"
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

  s.subspec 'IMKit' do |kit|
    kit.resources = "Resource/*.*"
    kit.source_files = 'RongIMKit/**/*.{h,m,c}'
    kit.dependency 'RongCloudIM/IMLib','5.0.0'
  end

  s.subspec 'Sticker' do |rs|
    rs.source_files = 'RongSticker/**/*.{h,m,c}'
    rs.dependency 'QRongIMSDK_UI/IMKit'
  end

  s.subspec 'Sight' do |st|
    st.source_files = 'RongSight/**/*.{h,m}'
    st.dependency 'QRongIMSDK_UI/IMKit'
  end

end
