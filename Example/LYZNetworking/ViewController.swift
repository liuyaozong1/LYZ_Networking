//
//  ViewController.swift
//  LYZNetworking
//
//  Created by 648731281@qq.com on 09/03/2021.
//  Copyright (c) 2021 648731281@qq.com. All rights reserved.
//

import UIKit
import LYZNetworking
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let dic = ["atMeState":1,"openState":1,"userId": "f4b91a8bd9e1100123a4381fcc55194e","version": 150,"agreeState": 1,"muteNotificationsState": 0,"notifyState": 1,"userPushSetId": "73e5c12435f5aa2d2ed101f41970cc25","sourceType": 2,"replyState": 1
//                   ] as [String : Any]
        let dic = ["test": "1"]
        
        view.backgroundColor = .red
        //设置响应数据的格式
        LYZNetWorkingGlobalConfig.shared.responseSerializer = .json
        LYZNetWorkingGlobalConfig.shared.requestTimeOut = 15
        LYZNetWorkingGlobalConfig.shared.apiDomain = "http://mock.yonyoucloud.com/mock/19898/"
        LYZNetWorkingGlobalConfig.shared.headers = ["login-token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTU08iLCJQSE9ORSI6IjE3NzIzNTY2NDY4IiwiZXhwIjoxNjM5MDE1MzkwfQ.-u8fyWkRQIHhEgEuPOFqOGdpqmfMvgh_IlNSuwBEP6U","Accept": "application/json","DEVICE-NUMBER": "38414EB2-33B9-4DE5-B743-D197F5BA06B4","APP-VERSION":"1.0.0","PHONE-MODEL":"Simulator"]
        
        //创建接口模型
        let model = LYZApiModel(apiUrl: "msg", apiMethod: .put, apiName: "测试 put", apiDesc: "测试 put",isBody: false)
        //调用接口
        LYZHttpSessionManager.manager.load(apiModel: model, parameters: dic) { result in
            
        } failure: { error in
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

