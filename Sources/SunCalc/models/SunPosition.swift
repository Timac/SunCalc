//
//  SunPosition.swift
//  suncalc-example
//
//  Created by Shaun Meredith on 10/2/14.
//
// swiftlint:disable all

import Foundation

public class SunPosition {
	public var azimuth:Double
	public var altitude:Double
	
	init(azimuth:Double, altitude:Double) {
		self.azimuth = azimuth
		self.altitude = altitude
	}
}
// swiftlint:enable all
