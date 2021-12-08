//
//  LYZNetWorkingGlobalConfig.swift
//  LYZNetWorking
//
//  Created by liuyaozong on 2021/9/2.
//

import UIKit

public class LYZNetWorkingGlobalConfig: NSObject {
    
    public enum LYZHTTPMethod {
       /// Common HTTP methods.
       case get, post, put,delete,head
    
        var desc: String {
            switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
            case .put:
                return "PUT"
            case .delete:
                return "DELETE"
            case .head:
                return "HEAD"
            default:
                return ""
            }
        }
    }
    
    public enum LYZHTTPResponse {
        case data  //二进制元数据
        case string  //字符串
        case json //转成 json
        case xml //xml 解析
    }
    
    public static let shared = LYZNetWorkingGlobalConfig()
    
    ///基础 url
    public var apiDomain: String = ""
    ///超时时间
    public var requestTimeOut: TimeInterval = 15 //默认 15 秒
    
    public var requestSerialization: LYZHttpRequestSerialization = LYZHttpRequestSerialization()
  
    
    /****NSURLRequestCachePolicy枚举值：**
    **NSURLRequestUseProtocolCachePolicy = 0：**默认的缓存策略， 如果缓存不存在，直接从服务端获取。如果缓存存在，会根据response中的Cache-Control字段判断下一步操作，如: Cache-Control字段为must-revalidata, 则询问服务端该数据是否有更新，无更新的话直接返回给用户缓存数据，若已更新，则请求服务端。
    **NSURLRequestReloadIgnoringLocalCacheData = 1：**数据需要从原始地址加载。不使用现有缓存。
    **NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4：**不仅忽略本地缓存，同时也忽略代理服务器或其他中间介质目前已有的、协议允许的缓存。
    **NSURLRequestReturnCacheDataElseLoad = 2：**无论缓存是否过期，先使用本地缓存数据。如果缓存中没有请求所对应的数据，那么从原始地址加载数据。
    **NSURLRequestReturnCacheDataDontLoad = 3：**无论缓存是否过期，先使用本地缓存数据。如果在缓存中没有已存数据来响应URL加载请求的话，不去尝试从源段加载数据，此时认为加载请求失败，（即：“离线”模式）。
    **NSURLRequestReloadRevalidatingCacheData = 5：**从原始地址确认缓存数据的合法性后，缓存数据就可以使用，否则从原始地址加载（在使用前去服务器验证）。**/
    ///全局缓存 策略
    public var cachePolicy: NSURLRequest.CachePolicy = .useProtocolCachePolicy //默认的缓存策略
    ///会话配置
    public var Configuration = URLSessionConfiguration.default  //默认配置 默认的URL会话配置对象，其存储方式是基于硬盘的持久化存储方式，会保存用户的证书到钥匙串中
    ///全局 header
    /// request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    /// request.setValue("application/json, */*", forHTTPHeaderField: "Accept")
    public var headers: [String : String]?
    ///解析模式
    public var responseSerializer: LYZHTTPResponse = .data
    
    
}
