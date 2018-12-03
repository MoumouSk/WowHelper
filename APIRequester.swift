//
//  File.swift
//  WowTest
//
//  Created by Tom Hays on 06/11/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequester {
    
    let username = "eaf6394630ac4901b9ec4b19eaab379d"
    let password = "9DPZrnF3AgBiYnQnYWBwuLDTLelZD66e"
    
    var headers: HTTPHeaders = [:]
    let parameters: Parameters = ["grant_type": "client_credentials"]
    var oauth2Object = OAuth2Object()
    
    let sessionManager = SessionManager()
    let requestRetrier = APIRequestRetrier()
    
    func retrieveAccessToken(completion : @escaping (_ results: String?) -> Void)  {
        if let authorizationHeader = Request.authorizationHeader(user: username, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
            headers["Content-Type"] = "application/x-www-form-urlencoded"
        }
        sessionManager.retrier = requestRetrier
        sessionManager.request("https://us.battle.net/oauth/token", method: .post, parameters: parameters, headers: headers).authenticate(user: username, password: password)
            .responseJSON { response in
                guard let json = response.result.value as? [String: AnyObject], let access_token = json["access_token"] as? String else {
                    print("Malformed data received from request.")
                    completion(nil)
                    return
                }
                let access = access_token
                completion(access)
        }
    }
    
    func simpleGetRequest(url: String, completion: @escaping (Data?) -> Void) {
        sessionManager.retrier = requestRetrier
        sessionManager.request(url).validate().responseString { response in
            switch response.result {
            case .success:
                let data = response.data
                completion(data)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
        completion(nil)
    }
    
}
