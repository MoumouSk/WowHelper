

import Foundation
struct Keystone_affixes : Codable {
	let keystone_affix : Keystone_affix?
	let starting_level : Int?

	enum CodingKeys: String, CodingKey {

		case keystone_affix = "keystone_affix"
		case starting_level = "starting_level"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		keystone_affix = try values.decodeIfPresent(Keystone_affix.self, forKey: .keystone_affix)
		starting_level = try values.decodeIfPresent(Int.self, forKey: .starting_level)
	}

}
