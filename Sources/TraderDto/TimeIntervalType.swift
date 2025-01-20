//
//  TimeIntervalType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 20.01.2025.
//

public enum TimeIntervalType: String, Codable, Sendable {
	public static let schema: String = "time_interval_type"

	case m1
	case m10
	case h1
	case d1
	case w1
	case mn1
	case q1

	public var moexInterval: Int {
		switch self {
		case .m1:
			1
		case .m10:
			10
		case .h1:
			60
		case .d1:
			24
		case .w1:
			7
		case .mn1:
			30
		case .q1:
			4
		}
	}
}
