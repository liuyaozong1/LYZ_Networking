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
        
        let dic = [
            "type" : "",
            "page" : "",
            "page_size" : "",
            "is_filter" : "",
            "key" : "0b35bec413d59aab9f7a5abcbccb21ab"
        ]
        
        view.backgroundColor = .red
        
        LYZNetWorkingGlobalConfig.shared.responseSerializer = .data
        LYZNetWorkingGlobalConfig.shared.requestTimeOut = 15
        let model = LYZApiModel(apiUrl: "http://v.juhe.cn/toutiao/index", apiMethod: .post, apiName: "网易新闻", apiDesc: "网易新闻的简介",isBody: false)
        LYZHttpSessionManager.manager.load(apiModel: model, parameters: dic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

