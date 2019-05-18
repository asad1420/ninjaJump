//
//  constants.swift
//  ninjaJump
//
//  Created by Muhammad Asad on 9/27/16.
//  Copyright © 2016 Muhammad Asad. All rights reserved.
//

import Foundation
import UIKit

let kmlGroundHeight: CGFloat = 20.0
let timeForWall: NSTimeInterval = 2
let kDefaultXtoMovePerSec: CGFloat = 320.0

// for Physics

let heroPhy: UInt32 = 0x1 << 0
let wallPhy: UInt32 = 0x1 << 1
var score = 0