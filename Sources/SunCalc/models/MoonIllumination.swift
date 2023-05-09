//
//  MoonIllumination.swift
//  suncalc-example
//
//  Created by Shaun Meredith on 10/2/14.
//

import Foundation

public class MoonIllumination {
	public var fraction:Double
	public var phase:Double
	public var angle:Double
	
	init(fraction:Double, phase:Double, angle:Double) {
		self.fraction = fraction
		self.phase = phase
		self.angle = angle
	}
}
