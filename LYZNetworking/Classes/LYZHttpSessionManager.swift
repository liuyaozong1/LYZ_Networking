//
//  LYZHttpSessionManager.swift
//  LYZNetWorking
//
//  Created by liuyaozong on 2021/9/2.
//

import UIKit

public class LYZHttpSessionManager: LYZURLSessionManager {
    public  static let manager = LYZHttpSessionManager()
}
//请求方法的配置
public extension LYZHttpSessionManager {
    public func load(apiModel: LYZApiModel,parameters: Any) {
        guard let  request = globalConfiguration.requestSerialization.requestWithModel(apiModel: apiModel, parameters: parameters) else {
            return
        }
        
        //发起请求
        print("<------接口\(apiModel.apiName)开始请求------->")
        print("httpHeaders:\n\n\(request.allHTTPHeaderFields ?? [:])\n\n")
        print("参数是:\n\n\(parameters)\n\n")
        
        session?.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            if   (error == nil), let _data = data {
                
                if LYZNetWorkingGlobalConfig.shared.responseSerializer == .data {
                    let str = String(data: _data, encoding: .utf8)
                    print("返回的数据是----\n\n\(String(describing: str))\n")
                } else if LYZNetWorkingGlobalConfig.shared.responseSerializer == .json {
                      let json =  try? JSONSerialization.jsonObject(with: _data, options: .allowFragments)
                       print("返回的json数据是----\n\n\(String(describing: json))\n")
                    
                } else if LYZNetWorkingGlobalConfig.shared.responseSerializer == .xml {
                    
                }
                
            } else {
                print("接口报错----\(error)")
            }
            
            
            print("<---------接口\(apiModel.apiName)请求结束------------------>")
        }).resume()
        
    }
    
    
    
    
    
}


