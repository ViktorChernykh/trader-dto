//
//  TimeIntervalType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 20.01.2025.
//

public enum TimeIntervalType: String, Codable, Sendable {
	public static let schema: String = "time_interval_type"

	case m1
	case m2
	case m3
	case m5
	case m10
	case m15
	case m30
	case h1
	case h2
	case h3
	case h4
	case d1
	case w1
	case mn1
	case q1
	case q2
	case y1

	/// Timeframe quantity.
	public var size: Int {
		switch self {
		case .m1:
			1
		case .m2:
			2
		case .m3:
			3
		case .m5:
			5
		case .m10:
			10
		case .m15:
			15
		case .m30:
			30
		case .h1:
			1
		case .h2:
			2
		case .h3:
			3
		case .h4:
			4
		case .d1:
			1
		case .w1:
			1
		case .mn1:
			1
		case .q1:
			1
		case .q2:
			2
		case .y1:
			1
		}
	}

	public var moexInterval: Int {
		switch self {
		case .m1:
			1
		case .m2:
			2
		case .m3:
			3
		case .m5:
			5
		case .m10:
			10
		case .m15:
			15
		case .m30:
			30
		case .h1:
			60
		case .h2:
			120
		case .h3:
			180
		case .h4:
			240
		case .d1:
			24
		case .w1:
			7
		case .mn1:
			30
		case .q1:
			4
		case .q2:
			6
		case .y1:
			12
		}
	}
}
