
import Foundation

struct Specialization : Codable {
	let id : Int?
    var role = Role.DPS

	enum CodingKeys: String, CodingKey {
		case id = "id"
	}
    
    enum Role {
        case Tank
        case Heal
        case DPS
    }
    
    mutating func setRole(id: Int) {
        if id == 66 || id == 73 ||
            id == 104 || id == 250 ||
            id == 268 || id == 581 {
            role = Role.Tank
        }
        else if id == 65 || id == 105 ||
            id == 256 || id == 257 ||
            id == 264 || id == 270 {
            role = Role.Heal
        }
        else {
            role = Role.DPS
        }
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
        setRole(id: id!)
	}
}
