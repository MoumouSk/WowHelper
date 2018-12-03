/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
	let _links : _links?
	let map : Map?
	let period : Int?
	let period_start_timestamp : Int?
	let period_end_timestamp : Int?
	let connected_realm : Connected_realm?
	let leading_groups : [Leading_groups]?
	let keystone_affixes : [Keystone_affixes]?
	let map_challenge_mode_id : Int?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case _links = "_links"
		case map = "map"
		case period = "period"
		case period_start_timestamp = "period_start_timestamp"
		case period_end_timestamp = "period_end_timestamp"
		case connected_realm = "connected_realm"
		case leading_groups = "leading_groups"
		case keystone_affixes = "keystone_affixes"
		case map_challenge_mode_id = "map_challenge_mode_id"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_links = try values.decodeIfPresent(_links.self, forKey: ._links)
		map = try values.decodeIfPresent(Map.self, forKey: .map)
		period = try values.decodeIfPresent(Int.self, forKey: .period)
		period_start_timestamp = try values.decodeIfPresent(Int.self, forKey: .period_start_timestamp)
		period_end_timestamp = try values.decodeIfPresent(Int.self, forKey: .period_end_timestamp)
		connected_realm = try values.decodeIfPresent(Connected_realm.self, forKey: .connected_realm)
		leading_groups = try values.decodeIfPresent([Leading_groups].self, forKey: .leading_groups)
		keystone_affixes = try values.decodeIfPresent([Keystone_affixes].self, forKey: .keystone_affixes)
		map_challenge_mode_id = try values.decodeIfPresent(Int.self, forKey: .map_challenge_mode_id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
