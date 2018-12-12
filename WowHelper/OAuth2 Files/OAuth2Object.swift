//
//  OAuth2Object.swift
//  WowTest
//
//  Created by Tom Hays on 29/10/2018.
//  Copyright © 2018 Msk. All rights reserved.
//  

import Foundation
import Alamofire
import p2_OAuth2

class OAuth2Object {
    
    fileprivate var alamofireManager: SessionManager?
    
    var myoauth2 = OAuth2CodeGrant(settings: [
    "client_id": "eaf6394630ac4901b9ec4b19eaab379d",
    //"client_secret": "9DPZrnF3AgBiYnQnYWBwuLDTLelZD66e",
    "authorize_uri": "https://eu.battle.net/oauth/authorize",
    "token_uri": "https://eu.battle.net/oauth/token",
    "scope": "wow.profile",
    "redirect_uris": ["https://www.google.fr"],
    "verbose": true,
    ] as OAuth2JSON)
    
    func handleSignIn () {
        let sessionManager = SessionManager()
        let retrier = OAuth2RetryHandler(oauth2: myoauth2)
        sessionManager.adapter = retrier
        sessionManager.retrier = retrier
        self.alamofireManager = sessionManager   // you must hold on to this somewhere
        
        sessionManager.request("https://eu.api.blizzard.com//wow/achievement/2144").validate().responseJSON { response in
            debugPrint(response)
        }
    }
}
