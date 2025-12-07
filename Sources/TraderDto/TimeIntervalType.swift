//
//  TimeIntervalType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 20.01.2025.
//

public enum TimeIntervalType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "time_interval_type"

	public var id: String {
		rawValue
	}

	case m1 = "M1"
	case m2 = "M2"
	case m3 = "M3"
	case m5 = "M5"
	case m10 = "M10"
	case m15 = "M15"
	case m30 = "M30"
	case h1 = "H1"
	case h2 = "H2"
	case h3 = "H3"
	case h4 = "H4"
	case d1 = "D1"
	case w1 = "W1"
	case mn1 = "MN1"
	case q1 = "Q1"
	case q2 = "Q2"
	case y1 = "Y1"

	/// Timeframe quantity.
	public var int: Int {
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
			31
		case .q1:
			91
		case .q2:
			182
		case .y1:
			365
		}
	}

	public var moexInterval: Int? {
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
		default:
			nil
		}
	}

	public init?(moexInterval: Int) {
		switch moexInterval {
		case 1:
			self = .m1
		case 10:
			self = .m10
		case 60:
			self = .h1
		case 24:
			self = .d1
		case 7:
			self = .w1
		case 30:
			self = .mn1
		case 4:
			self = .q1
		default:
			return nil
		}
	}
}
