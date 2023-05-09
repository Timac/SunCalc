//
//  MoonTimes.swift
//  suncalc-example
//
//  Created by Shaun Meredith on 7/16/19.
//
// swiftlint:disable all

import Foundation

public class MoonTimes {
    public var rise:Date?
    public var set:Date?
    public var alwaysUp:Bool
    public var alwaysDown:Bool
    
    init(rise:Date?, set:Date?, alwaysUp:Bool, alwaysDown:Bool) {
        self.rise = rise
        self.set = set
        self.alwaysUp = alwaysUp
        self.alwaysDown = alwaysDown
    }
}
// swiftlint:enable all
