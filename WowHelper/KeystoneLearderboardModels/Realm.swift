

import Foundation
struct Realm : Codable {
	let id : Int?
	let slug : String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case slug = "slug"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
	}

}
