# KTMapSDK

[![CI Status](https://img.shields.io/travis/181310067@qq.com/KTMapSDK.svg?style=flat)](https://travis-ci.org/181310067@qq.com/KTMapSDK)
[![Version](https://img.shields.io/cocoapods/v/KTMapSDK.svg?style=flat)](https://cocoapods.org/pods/KTMapSDK)
[![License](https://img.shields.io/cocoapods/l/KTMapSDK.svg?style=flat)](https://cocoapods.org/pods/KTMapSDK)
[![Platform](https://img.shields.io/cocoapods/p/KTMapSDK.svg?style=flat)](https://cocoapods.org/pods/KTMapSDK)

## Example

pod lib lint KTMapSDK.podspec --verbose --use-libraries --allow-warnings --no-clean

pod spec lint KTMapSDK.podspec --verbose --use-libraries --allow-warnings --no-clean

pod trunk push KTMapSDK.podspec --verbose --use-libraries --allow-warnings 

## Requirements

## Installation

KTMapSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KTMapSDK'
```

## Author

181310067@qq.com, huangzhentong@keytop.com.cn

## License

KTMapSDK is available under the MIT license. See the LICENSE file for more info.

科拓速停车室内定位SDK

//集成
pod 'KTMapSDK'

//-------
cocoapods 找不到库

方法1
pod repo update

方法2
前往~/Library/Caches/CocoaPods/ 
删除search_index.json 
再重新 pod search KTMapSDK


//需要在plist 文件内添加权限

App Transport Security Settings 
Privacy - Bluetooth Always Usage Description
Privacy - Location Always and When In Use Usage Description
Privacy - Location When In Use Usage Description


//使用方式
// 传入一个viewController 以及高德APIKey
[KTSDK presentSDK:self mapAPIKey:@""];



