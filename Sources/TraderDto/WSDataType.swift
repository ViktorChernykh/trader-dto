//
//  WSDataType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 25.08.2024.
//

public enum WSDataType: String, Codable, Sendable {
	case candles
	case securities
	case security

	case lines
	case updateLines
	case deleteLines

	case chartMessages
	case notification
}
