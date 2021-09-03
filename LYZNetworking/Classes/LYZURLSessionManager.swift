//
//  LYZURLSessionManager.swift
//  LYZNetWorking
//
//  Created by liuyaozong on 2021/9/2.
//

import UIKit

public class LYZURLSessionManager: NSObject, URLSessionDelegate {
    ///网络请求会话
    public var session: URLSession?
    ///网络请求地址
    public var url: URL?
    ///会话配置
    public let configuration: URLSessionConfiguration
    ///请求
    public var request: NSMutableURLRequest?
    ///全局配置
    public var globalConfiguration: LYZNetWorkingGlobalConfig
    
    public var requestSerialization: LYZHttpRequestSerialization
    
    override init() {
        globalConfiguration = LYZNetWorkingGlobalConfig.shared
        configuration = LYZNetWorkingGlobalConfig.shared.Configuration
        requestSerialization = LYZNetWorkingGlobalConfig.shared.requestSerialization
        super.init()
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)
        
        
    }
    
    
    
    
}

//extension LYZURLSessionManager: URLSessionDelegate {
//
//
//
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        print("输出了-----2")
//    }
//
//    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
//        print("输出了-----6")
//    }
//
//
//    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
//        print("输出了-----7")
//    }
//
//    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
//        print("输出了-----8")
//    }
//
//
//}
//
//
//extension LYZURLSessionManager: URLSessionDataDelegate {
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//
//        print("输出了-----3")
//    }
//
//    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        print("输出了-----1")
//    }
//
//
//
//
//}
//
//extension LYZURLSessionManager: URLSessionTaskDelegate {
//    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
//        print("输出了-----4")
//    }
//
//    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        print("输出了-----5")
//    }
//
//}
