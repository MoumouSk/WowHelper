

import Foundation
struct Profile : Codable {
	let name : String?
	let id : Int?
	let realm : Realm?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case id = "id"
		case realm = "realm"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		realm = try values.decodeIfPresent(Realm.self, forKey: .realm)
	}

}
