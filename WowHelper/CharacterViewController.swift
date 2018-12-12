//
//  CharacterViewController.swift
//  WowHelper
//
//  Created by Tom Hays on 11/12/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    var APIHandler = APIRequester()
    var characterBackgroundImage : UIImage?
    var character : CharacterBase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parent = self.tabBarController as! MainTabBarController
        let accessToken = parent.accessToken
        
        self.APIHandler.simpleGetRequest(url: "https://eu.api.blizzard.com/wow/character/hyjal/Emesca?locale=fr_FR&access_token=\(String(describing:accessToken!))") {
            data in
            guard let getData = data else { return }
            do {
                print("CharacterViewController: Requesting character info...")
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CharacterBase.self, from: getData)
                self.character = responseModel
            } catch {
                print("Error caught while requesting Character information.")
            }
            guard let backgroundURL = self.character?.backgroundImage else { return }
//            guard let insetURL = self.character?.insetImage else { return }
//            guard let avatarURL = self.character?.thumbnail else { return }
            self.APIHandler.getImageByURL(url: "https://render-eu.worldofwarcraft.com/character/\(backgroundURL)") {
                imageToGet in
                guard let getImg = imageToGet else { return }
                do {
                    print("CharacterViewController: Requesting character image...")
                    let screenSize : CGRect = UIScreen.main.bounds
                    let size = CGSize(width: screenSize.width, height: screenSize.height)
                    let aspectScaledToFillImage = getImg.af_imageAspectScaled(toFill: size)
                    //let aspectScaledToFitImage = getImg.af_imageAspectScaled(toFit: size)
                    self.characterBackgroundImage = aspectScaledToFillImage
                    self.view.backgroundColor = UIColor(patternImage: self.characterBackgroundImage!)
                }
            }
            
        }

    }
}
