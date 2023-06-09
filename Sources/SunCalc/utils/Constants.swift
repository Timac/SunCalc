//
//  Constants.swift
//  suncalc-example
//
//  Created by Shaun Meredith on 10/2/14.
//

import Foundation

// swiftlint:disable:next identifier_name
let π = 3.14159265358979

class Constants {

	class func RAD() -> Double {
		return π / 180.0
	}

	// swiftlint:disable:next identifier_name
	class func E() -> Double {
		return Constants.RAD() * 23.4397 // obliquity of the earth
	}

	class func PI() -> Double {
		return π
	}
}
