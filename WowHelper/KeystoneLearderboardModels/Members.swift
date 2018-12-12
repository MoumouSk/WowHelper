
import Foundation

struct Members : Codable {
	let profile : Profile?
	let faction : Faction?
	let specialization : Specialization?

	enum CodingKeys: String, CodingKey {

		case profile = "profile"
		case faction = "faction"
		case specialization = "specialization"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		profile = try values.decodeIfPresent(Profile.self, forKey: .profile)
		faction = try values.decodeIfPresent(Faction.self, forKey: .faction)
		specialization = try values.decodeIfPresent(Specialization.self, forKey: .specialization)
	}
}
