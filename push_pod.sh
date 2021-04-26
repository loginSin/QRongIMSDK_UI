#!/bin/sh

# 统一归纳 SDK 的资源，统一管理资源文件

target_path="Resources"

if [ ! -d $target_path ];then
	mkdir $target_path
fi

rsync -a IMKit/Resource/* $target_path/ && rm -rf IMKit/Resource/
rsync -a Sticker/Resource/* $target_path/ && rm -rf Sticker/Resource/
rsync -a iFlyKit/Resource/* $target_path/ && rm -rf iFlyKit/Resource/
rsync -a CallKit/Resources/* $target_path/ && rm -rf CallKit/Resources/

# 推 pod

pod repo push Spec QRongIMSDK_UI.podspec --allow-warnings --use-libraries --verbose