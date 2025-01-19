//
//  WSTitle.swift
//	trader-dto
//
//  Created by Victor Chernykh on 08.08.2024.
//

public enum WSTitle: String, CustomStringConvertible, Codable, Sendable {
	case message = "MESSAGE"
	case error = "ERROR"
	case connected = "CONNECTED"
	case closed = "CLOSED"

	public var description: String {
		rawValue
	}
}
