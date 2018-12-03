
import Foundation

struct RealmInfosBase : Codable {
	let realms : [RealmsInfos]?

	enum CodingKeys: String, CodingKey {
		case realms = "realms"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		realms = try values.decodeIfPresent([RealmsInfos].self, forKey: .realms)
	}

}
