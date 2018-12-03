
import Foundation

struct CurrentKeystoneGeneralInfosBase : Codable {
    let current_period : Int?
    let current_period_start_timestamp : Int?
    let current_period_end_timestamp : Int?
    let current_keystone_affixes : [Current_keystone_affixes]?

    enum CodingKeys: String, CodingKey {
        case current_period = "current_period"
        case current_period_start_timestamp = "current_period_start_timestamp"
        case current_period_end_timestamp = "current_period_end_timestamp"
        case current_keystone_affixes = "current_keystone_affixes"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current_period = try values.decodeIfPresent(Int.self, forKey: .current_period)
        current_period_start_timestamp = try values.decodeIfPresent(Int.self, forKey: .current_period_start_timestamp)
        current_period_end_timestamp = try values.decodeIfPresent(Int.self, forKey: .current_period_end_timestamp)
        current_keystone_affixes = try values.decodeIfPresent([Current_keystone_affixes].self, forKey: .current_keystone_affixes)
    }

}

