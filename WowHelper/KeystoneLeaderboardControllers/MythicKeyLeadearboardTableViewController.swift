//
//  TableViewController.swift
//  WowTest
//
//  Created by Tom Hays on 07/11/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import UIKit

class MythicKeyLeaderboardTableViewController: UITableViewController {

    let APIHandler = APIRequester()
    var mythicKeyCollection = [MythicKeyLeaderboard]()
    var mythicCollection: MythicKeyLeaderboardModel?
    var accessToken: String?
    var dungeonId: Int?
    let completedDateFormatter = DateFormatter()
    let completedTimeFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completedDateFormatter.dateFormat = "dd/MM/yy"
        completedTimeFormatter.timeZone = TimeZone(identifier: "UTC")
        completedTimeFormatter.dateFormat = "HH:mm:ss"
        
        if (accessToken == nil) {
            print("Access token is currently nil. Requesting it again.")
            APIHandler.retrieveAccessToken() {
                access_token in
                if let accessToken = access_token {
                    self.accessToken = accessToken
                }
                self.APIHandler.simpleGetRequest(url: "https://eu.api.blizzard.com/data/wow/connected-realm/1390/mythic-leaderboard/244/period/672?namespace=dynamic-eu&locale=fr_FR&access_token=\(String(describing: self.accessToken!))") {
                    data in
                   guard let getData = data else { return }
                    do {
                        let jsonDecoder = JSONDecoder()
                        let responseModel = try jsonDecoder.decode(MythicKeyLeaderboardModel.self, from: getData)
                        self.mythicCollection = responseModel
                        self.tableView.reloadData()
                        //print("RESPONSE MODEL : \(responseModel)")
                    } catch {
                        print("Caught Error")
                    }
                }
            }
        } else {
            self.APIHandler.simpleGetRequest(url: "https://eu.api.blizzard.com/data/wow/connected-realm/1390/mythic-leaderboard/244/period/672?namespace=dynamic-eu&locale=fr_FR&access_token=\(String(describing: self.accessToken!))") {
                data in
                guard let getData = data else { return }
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(MythicKeyLeaderboardModel.self, from: getData)
                    self.mythicCollection = responseModel
                    self.tableView.reloadData()
                } catch {
                    print("Caught Error")
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (mythicCollection != nil) {
            return mythicCollection!.leading_groups!.count
        } else { return 0 }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "mythicCellIdentifier", for: indexPath) as! MythicKeyLeaderboardTableViewCell

        let ranking = mythicCollection!.leading_groups![indexPath.item].ranking
        let keystone_level = mythicCollection!.leading_groups![indexPath.item].keystone_level
        
        let rawCompletedDate = Double((mythicCollection?.leading_groups![indexPath.item].completed_timestamp)! / 1000)
        let convertedCompletedDate = Date(timeIntervalSince1970: rawCompletedDate)
        
        let rawCompletedTime = Double((mythicCollection?.leading_groups![indexPath.item].duration)! / 1000)
        let convertedCompletedTime = Date(timeIntervalSince1970: rawCompletedTime)
        
        mythicCollection?.leading_groups![indexPath.item].sortMembersBySpec()
        
        cell.mythicRankingLabelCell.text = String(ranking!)
        
        cell.mythicKeystoneLabelCell.text = String(keystone_level!)

        cell.mythicName1LabelCell.text = mythicCollection?.leading_groups![indexPath.item].members![0].profile?.name
        cell.mythicName1LabelCell.textColor = setClassColor(spe: (mythicCollection?.leading_groups![indexPath.item].members![0].specialization?.id)!)

        cell.mythicName2LabelCell.text = mythicCollection?.leading_groups![indexPath.item].members![1].profile?.name
        cell.mythicName2LabelCell.textColor = setClassColor(spe: (mythicCollection?.leading_groups![indexPath.item].members![1].specialization?.id)!)
        
        cell.mythicName3LabelCell.text = mythicCollection?.leading_groups![indexPath.item].members![2].profile?.name
        cell.mythicName3LabelCell.textColor = setClassColor(spe: (mythicCollection?.leading_groups![indexPath.item].members![2].specialization?.id)!)
        
        cell.mythicName4LabelCell.text = mythicCollection?.leading_groups![indexPath.item].members![3].profile?.name
        cell.mythicName4LabelCell.textColor = setClassColor(spe: (mythicCollection?.leading_groups![indexPath.item].members![3].specialization?.id)!)
        
        cell.mythicName5LabelCell.text = mythicCollection?.leading_groups![indexPath.item].members![4].profile?.name
        cell.mythicName5LabelCell.textColor = setClassColor(spe: (mythicCollection?.leading_groups![indexPath.item].members![4].specialization?.id)!)

        cell.mythicTimeCompletedLabelCell.text = completedTimeFormatter.string(from: convertedCompletedTime)
        
        cell.mythicDateCompletedLabelCell.text = completedDateFormatter.string(from: convertedCompletedDate)

        return cell
    }
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
