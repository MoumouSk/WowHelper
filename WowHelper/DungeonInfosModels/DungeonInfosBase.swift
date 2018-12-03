

import Foundation

struct DungeonInfosBase : Codable {
    
	let dungeonInfos : [DungeonInfos]?

	enum CodingKeys: String, CodingKey {
		case dungeonInfos = "current_leaderboards"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dungeonInfos = try values.decodeIfPresent([DungeonInfos].self, forKey: .dungeonInfos)
	}
}
