
import Foundation
struct Leading_groups : Codable {
	let ranking : Int?
	let duration : Int?
	let completed_timestamp : Int?
	let keystone_level : Int?
    var members : [Members]?

	enum CodingKeys: String, CodingKey {
		case ranking = "ranking"
		case duration = "duration"
		case completed_timestamp = "completed_timestamp"
		case keystone_level = "keystone_level"
		case members = "members"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		ranking = try values.decodeIfPresent(Int.self, forKey: .ranking)
		duration = try values.decodeIfPresent(Int.self, forKey: .duration)
		completed_timestamp = try values.decodeIfPresent(Int.self, forKey: .completed_timestamp)
		keystone_level = try values.decodeIfPresent(Int.self, forKey: .keystone_level)
		members = try values.decodeIfPresent([Members].self, forKey: .members)
	}
    
    mutating func sortMembersBySpec() {
        var tankIndex: Int
        var healIndex: Int
        
        for index in members!.indices {
            if members![index].specialization!.role == .TANK {
                tankIndex = index
                members?.swapAt(tankIndex, 0)
            }
            else if members![index].specialization!.role == .HEAL {
                healIndex = index
                members?.swapAt(healIndex, 1)
            }
        }
    }
}
