
import Foundation

struct KeystoneLeaderboardBase : Codable {
	let map : Map?
	let period : Int?
	let period_start_timestamp : Int?
	let period_end_timestamp : Int?
	var leading_groups : [Leading_groups]?
	let keystone_affixes : [Keystone_affixes]?
	let map_challenge_mode_id : Int?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case map = "map"
		case period = "period"
		case period_start_timestamp = "period_start_timestamp"
		case period_end_timestamp = "period_end_timestamp"
		case leading_groups = "leading_groups"
		case keystone_affixes = "keystone_affixes"
		case map_challenge_mode_id = "map_challenge_mode_id"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		map = try values.decodeIfPresent(Map.self, forKey: .map)
		period = try values.decodeIfPresent(Int.self, forKey: .period)
		period_start_timestamp = try values.decodeIfPresent(Int.self, forKey: .period_start_timestamp)
		period_end_timestamp = try values.decodeIfPresent(Int.self, forKey: .period_end_timestamp)
		leading_groups = try values.decodeIfPresent([Leading_groups].self, forKey: .leading_groups)
		keystone_affixes = try values.decodeIfPresent([Keystone_affixes].self, forKey: .keystone_affixes)
		map_challenge_mode_id = try values.decodeIfPresent(Int.self, forKey: .map_challenge_mode_id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
