//
//  LYZHttpRequestSerialization.swift
//  LYZNetWorking
//
//  Created by liuyaozong on 2021/9/2.
//

import UIKit

/// 配置上传参数 的序列化器
public class LYZHttpRequestSerialization: NSObject {
    
    public var requestParamUrlStr: String = ""
    
    //  创建 request
    public func requestWithModel(apiModel: LYZApiModel,parameters: Any?) -> NSMutableURLRequest? {
        var urlstr: String = ""
        if let apiDomain = apiModel.apiDomain {
            urlstr.append(apiDomain)
        } else {
            urlstr.append(LYZNetWorkingGlobalConfig.shared.apiDomain)
        }
        
        urlstr.append(apiModel.apiUrl)
        guard let url = URL(string: urlstr) else {
            print("url 不合法")
            return nil
        }
        
        //缓存策略
        var cachePolicy: NSURLRequest.CachePolicy
        if let _cachePolicy = apiModel.cachePolicy  {
            cachePolicy = _cachePolicy
        } else {
            cachePolicy = LYZNetWorkingGlobalConfig.shared.cachePolicy
        }
        
        ///超时时间
        var  requestTimeOut: TimeInterval
        if let _requestTimeOut = apiModel.requestTimeOut  {
            requestTimeOut = _requestTimeOut
        } else {
            requestTimeOut = LYZNetWorkingGlobalConfig.shared.requestTimeOut
        }
        
        ///headers
        var headers: [String : String]
        if let _headers = apiModel.headers {
            headers = _headers
        } else {
            headers = LYZNetWorkingGlobalConfig.shared.headers ?? [:]
        }
        
        serializationParam(value: parameters)
        
        var _: String?
        if parameters != nil && apiModel.apiMethod == .get {
            if let _ = url.query {
                urlstr.append("&\(requestParamUrlStr)")
            } else {
                urlstr.append("?\(requestParamUrlStr)")
            }
        }
        
        guard let lasturl = URL(string: urlstr) else {
            print("url 不合法")
            return nil
        }
        //创建请求
        let request = NSMutableURLRequest(url: lasturl, cachePolicy: cachePolicy, timeoutInterval: requestTimeOut)
        request.httpMethod = apiModel.apiMethod.desc
        request.allHTTPHeaderFields = headers
        
        if apiModel.apiMethod == .post {
            request.httpBody = requestParamUrlStr.data(using: .utf8)
        }
        
        return request
    }
    
    //解析参数
    func serializationParam(value: Any) {
        test(value: value)
    }
    
    var list = [String]()
    
    func test(value: Any, str: String? = nil) {
        //如果是字典
        if value is [String : Any] {
            
            let dic = value  as! [String : Any]
            for item in dic.keys {
                var MStr: String = ""
                if  str == nil {
                    MStr = item
                } else {
                    MStr = str ?? ""
                    MStr.append("[\(item)]")
                }
                test(value: dic[item] as Any, str: MStr)
            }
        } else if value is [Any] {
            let arr = value as! [Any]
            for item in arr {
                
                var MStr: String = ""
                if  str == nil {
                    MStr = "(null)"
                } else {
                    MStr = str ?? ""
                    MStr.append("[]")
                }
                test(value: item, str: MStr)
            }
        } else {
            //输出
            var model = ParamItemModel()
            model.value = value
            model.key = str ?? ""
            list.append(model.desc)
        }

        let str = list.joined(separator: "&")
        print("list ---\(str)")
        requestParamUrlStr = str

    }
    
    func test2() -> String {
        
        return ""
    }
}

//解析参数的模型
struct ParamItemModel {
    var key: String = ""
    var value: Any = ""
    
    var desc: String {
    
        if value is String {
            return "\(key)=\(value as! String)"
        }
        if  value is Int {
            return "\(key)=\(String(format: "%ld", value as! Int))"
        }
        
        if  value is CGFloat {
            return "\(key)=\(String(format: "%lf", value as! CGFloat))"
        }
        
        if  value is Float {
            return "\(key)=\(String(format: "%lf", value as! Float))"
        }
        
        if  value is Double {
            return "\(key)=\(String(format: "%ll", value as! Double))"
        }
        
        return "\(key)=\(value)"
    }
    
    
}
