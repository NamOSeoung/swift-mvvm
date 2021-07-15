//
//  APIUrlService.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//


//공통 APIPath 호출 서비스
class APIUrlService {
    
    @Inject var readPList: ReadPList
    
    func serviceUrl(version: String,path: String) -> String {
       //개발
        return readPList.getAPIUrlPlistInfo() + version + path
   }
}
