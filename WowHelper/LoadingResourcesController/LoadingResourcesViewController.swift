//
//  LoadingResourcesViewController.swift
//  WowTest
//
//  Created by Tom Hays on 19/11/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import Foundation
import UIKit

class LoadingResourcesViewController: UIViewController {
    
    var APIHandler 	= APIRequester()
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var loadingBar: UIProgressView!
    
    var accessToken: String?
    var dungeonInfo: [DungeonInfos]?
    var realmInfo: [RealmsInfos]?
    var mythicChallengeInfo: CurrentKeystoneGeneralInfosBase?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "loadingResourcesToMythicKeystone") {
            if let navigationController = segue.destination as? UINavigationController {
                let childViewController = navigationController.topViewController as! KeystoneLeaderboardViewController
                guard self.accessToken != nil else {
                    return
                }
                print("Segue sending to activities !")
                childViewController.accessToken = self.accessToken!
                childViewController.dungeonInfo = self.dungeonInfo
                childViewController.realmInfo = self.realmInfo
                childViewController.mythicChallengeInfo = self.mythicChallengeInfo
            }
        }
    }
    
    func performSegue(identifier: String) {
        self.performSegue(withIdentifier: identifier, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingBar.progress = 0.0
        loadingBar.transform = loadingBar.transform.scaledBy(x: 1, y: 6)
        if (self.accessToken == nil) {
            APIHandler.retrieveAccessToken() {
                access_token in
                print("Requesting Access Token...")
                if let accessToken = access_token {
                    self.accessToken = accessToken
                    self.loadingBar.progress += 0.25
                }
                self.APIHandler.simpleGetRequest(url: "https://eu.api.blizzard.com/data/wow/connected-realm/1390/mythic-leaderboard/?namespace=dynamic-eu&locale=fr_FR&access_token=\(String(describing: self.accessToken!))") {
                    data in
                    guard let getData = data else { return }
                    do {
                        print("Requesting Dungeons Information...")
                        let jsonDecoder = JSONDecoder()
                        let responseModel = try jsonDecoder.decode(DungeonInfosBase.self, from: getData)
                        self.dungeonInfo = responseModel.dungeonInfos
                        self.loadingBar.progress += 0.25
                    } catch {
                        print("Error caught while requesting Dungeons information.")
                    }
                    self.APIHandler.simpleGetRequest(url: "https://eu.api.blizzard.com/data/wow/realm/?namespace=dynamic-eu&locale=fr_FR&access_token=\(String(describing: self.accessToken!))") {
                        data in
                        guard let getData = data else { return }
                        do {
                            print("Requesting Realms Information...")
                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(RealmInfosBase.self, from: getData)
                            self.realmInfo = responseModel.realms
                            self.loadingBar.progress += 0.25
                        } catch {
                            print("Error caught while requesting Realms information.")
                        }
                        self.APIHandler.simpleGetRequest(url: "https://eu.api.blizzard.com/data/wow/mythic-challenge-mode/?namespace=dynamic-eu&locale=fr_FR&access_token=\(String(describing: self.accessToken!))") {
                            data in
                            guard let getData = data else { return }
                            do {
                                print("Requesting Current Keystone information...")
                                let jsonDecoder = JSONDecoder()
                                let responseModel = try jsonDecoder.decode(CurrentKeystoneGeneralInfosBase.self, from: getData)
                                self.mythicChallengeInfo = responseModel
                                self.performSegue(identifier: "loadingResourcesToMythicKeystone")
                                self.loadingBar.progress += 0.25
                            } catch {
                                print("Error caught while requesting requesting Current Keystone information.")
                            }
                        }
                    }
                }
            }
        }
    }
}
