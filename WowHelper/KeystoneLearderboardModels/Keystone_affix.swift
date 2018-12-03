

import Foundation
struct Keystone_affix : Codable {
	let name : String?
	let id : Int?

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
	}

}
