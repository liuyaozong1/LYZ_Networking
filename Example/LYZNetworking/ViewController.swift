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
        
        let dic = ["title":"234","name":"123",
                   ] as [String : Any]
        
        view.backgroundColor = .red
        //设置响应数据的格式
        LYZNetWorkingGlobalConfig.shared.responseSerializer = .json
        LYZNetWorkingGlobalConfig.shared.requestTimeOut = 15
        LYZNetWorkingGlobalConfig.shared.apiDomain = "https://mock.mengxuegu.com/mock/6135aefc5c91b95c0946d13c/test/"
        //创建接口模型
        let model = LYZApiModel(apiUrl: "getApi", apiMethod: .get, apiName: "网易新闻", apiDesc: "网易新闻的简介",isBody: false)
        //调用接口
        LYZHttpSessionManager.manager.load(apiModel: model, parameters: dic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

