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
	case w1
	case d1
	case mn1
	case q1
}
