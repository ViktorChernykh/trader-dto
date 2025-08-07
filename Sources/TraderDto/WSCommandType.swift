//
//  WSCommandType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 08.07.2024.
//

public enum WSCommandType: String, Codable, Sendable {
	case request
	case subscribe
	case unsubscribe
}
