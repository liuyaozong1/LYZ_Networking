//
//  LYZHttpSessionManager.swift
//  LYZNetWorking
//
//  Created by liuyaozong on 2021/9/2.
//

import UIKit

public typealias successBlock = (Any) -> Void
public typealias failureBlock = (Error) -> Void


public class LYZHttpSessionManager: LYZURLSessionManager {
    public  static let manager = LYZHttpSessionManager()
}
//请求方法的配置
public extension LYZHttpSessionManager {
    public func load(apiModel: LYZApiModel,parameters: Any,success:@escaping successBlock, failure:@escaping failureBlock) {
        guard let  request = globalConfiguration.requestSerialization.requestWithModel(apiModel: apiModel, parameters: parameters) else {
            return
        }
        
       
        
        session?.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            //发起请求
            print("<------接口\(apiModel.apiName)开始请求------->")
            print("请求地址是:\(request.url?.absoluteString)\n")
            print("httpHeaders:\(request.allHTTPHeaderFields ?? [:])\n")
            print("参数是:\(parameters)\n")
            print("请求方法是:\(request.httpMethod)\n")
            if   (error == nil), let _data = data {
                
                if LYZNetWorkingGlobalConfig.shared.responseSerializer == .data {
                    let str = String(data: _data, encoding: .utf8)
                    print("返回的数据是----\n\(String(describing: str))\n")
                    success(_data)
                } else if LYZNetWorkingGlobalConfig.shared.responseSerializer == .json {
                      let json =  try? JSONSerialization.jsonObject(with: _data, options: .allowFragments)
                       print("返回的json数据是----\n\(String(describing: json))\n")
                      success(json)
                    
                } else if LYZNetWorkingGlobalConfig.shared.responseSerializer == .xml {
                    
                }
                
            } else {
                print("接口报错----\(error)")
            }
            
            
            print("<---------接口\(apiModel.apiName)请求结束------------------>")
        }).resume()
        
    }
    
    
    
    
    
}



