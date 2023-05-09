//
//  MoonPosition.swift
//  suncalc-example
//
//  Created by Shaun Meredith on 10/2/14.
//

import Foundation

public class MoonPosition {
	public var azimuth:Double
	public var altitude:Double
	public var distance:Double
	
	init(azimuth:Double, altitude:Double, distance:Double) {
		self.azimuth = azimuth
		self.altitude = altitude
		self.distance = distance
	}
}
