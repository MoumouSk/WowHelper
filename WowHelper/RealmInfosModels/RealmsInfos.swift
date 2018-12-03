

import Foundation

struct RealmsInfos : Codable {
	let name : String?
	let id : Int?
	let slug : String?

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case id = "id"
		case slug = "slug"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
	}

}
