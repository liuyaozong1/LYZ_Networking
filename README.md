# LYZNetworking

[![CI Status](https://img.shields.io/travis/648731281@qq.com/LYZNetworking.svg?style=flat)](https://travis-ci.org/648731281@qq.com/LYZNetworking)
[![Version](https://img.shields.io/cocoapods/v/LYZNetworking.svg?style=flat)](https://cocoapods.org/pods/LYZNetworking)
[![License](https://img.shields.io/cocoapods/l/LYZNetworking.svg?style=flat)](https://cocoapods.org/pods/LYZNetworking)
[![Platform](https://img.shields.io/cocoapods/p/LYZNetworking.svg?style=flat)](https://cocoapods.org/pods/LYZNetworking)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LYZNetworking is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LYZNetworking'
```

## Author

648731281@qq.com, 648731281@qq.com

## License

LYZNetworking is available under the MIT license. See the LICENSE file for more info.
```
//设置响应数据的格式
  LYZNetWorkingGlobalConfig.shared.responseSerializer = .data
  LYZNetWorkingGlobalConfig.shared.requestTimeOut = 15
  //创建接口模型
  let model = LYZApiModel(apiUrl: "http://v.juhe.cn/toutiao/index", apiMethod: .post, apiName: "网易新闻", apiDesc: "网易新闻的简介",isBody: false)
  //调用接口
  //设置响应数据的格式
  LYZNetWorkingGlobalConfig.shared.responseSerializer = .data
  LYZNetWorkingGlobalConfig.shared.requestTimeOut = 15
  //创建接口模型
  let model = LYZApiModel(apiUrl: "http://v.juhe.cn/toutiao/index", apiMethod: .post, apiName: "网易新闻", apiDesc: "网易新闻的简介",isBody: false)
  //调用接口
  LYZHttpSessionManager.manager.load(apiModel: model, parameters: dic) { result in
            
  } failure: { error in
            
  }

```
