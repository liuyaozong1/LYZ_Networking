//
//  LYZHttpModel.swift
//  LYZNetWorking
//
//  Created by liuyaozong on 2021/9/2.
//

import UIKit

public class LYZApiModel: NSObject {
    //接口地址
    public var apiUrl: String
    //接口类型
    public var apiMethod: LYZNetWorkingGlobalConfig.LYZHTTPMethod
    //接口名称
    public var apiName: String
    //接口简介
    public var apiDesc: String
    //是否是 body 传值 默认不是
    public var isBody: Bool
    //域名  如果配置了.则全局配置无效
    public var apiDomain: String?
    //headers  如果配置了 则全局配置无效
    public var headers: [String : String]?
    ///如果配置了 则全局配置无效
    public var cachePolicy: NSURLRequest.CachePolicy?
    ///超时时间
    public var requestTimeOut: TimeInterval?
    
    public init(apiUrl _apiUrl: String,apiMethod _apiMethod: LYZNetWorkingGlobalConfig.LYZHTTPMethod,apiName _apiName: String,apiDesc _apiDesc: String,isBody _isBody: Bool,apiDomain _apiDomain: String? = nil,headers _headers: [String : String]? = nil,cachePolicy _cachePolicy: NSURLRequest.CachePolicy? = nil,requestTimeOut _requestTimeOut: TimeInterval? = nil) {
        apiUrl = _apiUrl
        apiMethod = _apiMethod
        apiName = _apiName
        apiDesc = _apiDesc
        isBody = _isBody
        apiDomain = _apiDomain
        headers = _headers
        cachePolicy = _cachePolicy
        requestTimeOut = _requestTimeOut
        super.init()
        
    }
    
}
