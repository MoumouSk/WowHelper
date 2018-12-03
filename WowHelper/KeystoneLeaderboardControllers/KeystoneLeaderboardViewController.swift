//
//  MythicLeaderboardViewController.swift
//  WowTest
//
//  Created by Tom Hays on 06/11/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import UIKit
import Alamofire

class KeystoneLeaderboardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var APIHandler = APIRequester()
    var mythicKeyLeaderboardTableViewController: KeystoneLeaderboardTableViewController?
    var accessToken: String?
    var dungeonInfo: [DungeonInfos]?
    var realmInfo: [RealmsInfos]?
    var mythicChallengeInfo: CurrentKeystoneGeneralInfosBase?
    var isRealmButton: Bool = true
    
    @IBOutlet weak var pickServerButton: UIButton!
    @IBOutlet weak var pickDungeonButton: UIButton!
    @IBOutlet weak var serverAndDungeonPickerView: UIPickerView!
    @IBOutlet weak var mythicKeyLeaderboardTableView: UIView!
    
    @IBAction func pickServer(_ sender: UIButton) {
        isRealmButton = true
        serverAndDungeonPickerView.reloadAllComponents()
        serverAndDungeonPickerView.isHidden = !serverAndDungeonPickerView.isHidden
    }
    
    @IBAction func pickDungeon(_ sender: UIButton) {
        isRealmButton = false
        serverAndDungeonPickerView.reloadAllComponents()
        serverAndDungeonPickerView.isHidden = !serverAndDungeonPickerView.isHidden
    }
    
    @IBAction func openAffixPopup(_ sender: UIBarButtonItem) {
        let popupViewController = storyboard?.instantiateViewController(withIdentifier: "popupVC")
        popupViewController?.modalPresentationStyle = .overCurrentContext
        popupViewController?.modalTransitionStyle = .crossDissolve
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if (segue.identifier == "mythicKeyParentToEmbedList") {
            if let childViewController = destination as? KeystoneLeaderboardTableViewController {
                guard self.accessToken != nil else {
                    return
                }
                mythicKeyLeaderboardTableViewController = childViewController
                mythicKeyLeaderboardTableViewController?.accessToken = self.accessToken!
                mythicKeyLeaderboardTableViewController?.currentPeriod = self.mythicChallengeInfo?.current_period!
            }
        }
    }
    
    override func viewDidLoad() {   
        super.viewDidLoad()
        
        pickServerButton.layer.borderWidth = 1
        pickDungeonButton.layer.borderWidth = 1
        pickServerButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pickDungeonButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.serverAndDungeonPickerView.delegate = self
        self.serverAndDungeonPickerView.dataSource = self
        pickServerButton.setTitle("Hyjal", for: UIControl.State.normal)
        pickDungeonButton.setTitle("Atal'Dazar", for: UIControl.State.normal)
        serverAndDungeonPickerView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (isRealmButton) {
            return realmInfo!.count
        } else {
            return dungeonInfo!.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (isRealmButton) {
            return realmInfo![row].name
        } else {
            return dungeonInfo![row].name
        }
    }
    
    var dungeonId = 244
    var realmId = 1390
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (isRealmButton) {
            print(realmInfo![row].name!)
            print(realmInfo![row].id!)
            realmId = realmInfo![row].id!
            self.mythicKeyLeaderboardTableViewController?.makeMyhticKeystoneLeaderboardRequest(realm: realmId, dungeonId: dungeonId, period: (mythicChallengeInfo?.current_period)!, access_token: self.accessToken)
            pickServerButton.setTitle(realmInfo![row].name, for: UIControl.State.normal)
        } else {
            print(dungeonInfo![row].name!)
            print(dungeonInfo![row].id!)
            dungeonId = dungeonInfo![row].id!
            self.mythicKeyLeaderboardTableViewController?.makeMyhticKeystoneLeaderboardRequest(realm: realmId, dungeonId: dungeonId, period: (mythicChallengeInfo?.current_period)!, access_token: self.accessToken)
            pickDungeonButton.setTitle(dungeonInfo![row].name, for: UIControl.State.normal)
        }
    }
}
