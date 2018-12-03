//
//  UtilityFunctions.swift
//  WowTest
//
//  Created by Tom Hays on 13/11/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import Foundation
import UIKit

func setClassColor(spe: Int) -> UIColor {
    switch spe {
    case 62, 63, 64: // MAGO
        return UIColor(red: 0.25, green: 0.78, blue: 0.92, alpha: 1)
    case 65, 66, 70: // PALADIN
        return UIColor(red: 0.96, green: 0.55, blue: 0.73, alpha: 1)
    case 71, 72, 73: // WAR
        return UIColor(red: 0.78, green: 0.61, blue: 0.43, alpha: 1)
    case 102, 103, 104, 105: // DRUID
        return UIColor(red: 1.00, green: 0.49, blue: 0.04, alpha: 1)
    case 250, 251, 252: // DK
        return UIColor(red: 0.77, green: 0.12, blue: 0.23, alpha: 1)
    case 253, 254, 255: // HUNT
        return UIColor(red: 0.67, green: 0.83, blue: 0.45, alpha: 1)
    case 256, 257, 258: // PRIEST
        return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
    case 259, 260, 261: // ROGUE
        return UIColor(red: 1.00, green: 0.96, blue: 0.41, alpha: 1)
   case 262, 263, 264: // SHAMAN
        return UIColor(red: 0.00, green: 0.44, blue: 0.87, alpha: 1)
    case 265, 266, 267: // DEMO
        return UIColor(red: 0.53, green: 0.53, blue: 0.93, alpha: 1)
    case 268, 269, 270: // MONK
        return UIColor(red: 0.00, green: 1.00, blue: 0.59, alpha: 1)
    case 577, 581: // DEMON HUNTER
        return UIColor(red: 0.64, green: 0.19, blue: 0.79, alpha: 1)
    default:
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
