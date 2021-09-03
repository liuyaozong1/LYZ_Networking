//
//  LYZHttpModel.swift
//  LYZNetWorking
//
//  Created by liuyaozong on 2021/9/2.
//

import UIKit

struct LYZApiModel {
    //接口地址
    var apiUrl: String
    //接口类型
    var apiMethod: LYZNetWorkingGlobalConfig.LYZHTTPMethod
    //接口名称
    var apiName: String
    //接口简介
    var apiDesc: String
    //是否是 body 传值 默认不是
    var isBody: Bool
    //域名  如果配置了.则全局配置无效
    var apiDomain: String?
    //headers  如果配置了 则全局配置无效
    var headers: [String : String]?
    ///如果配置了 则全局配置无效
    var cachePolicy: NSURLRequest.CachePolicy?
    ///超时时间
    var requestTimeOut: TimeInterval?
    
}
