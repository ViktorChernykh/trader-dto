//
//  CompareType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 09.11.2024.
//

public enum CompareType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "compare_type"

	public var id: String { rawValue }

	case equal
	case less
	case more
	case across
	case acrossUp
	case acrossDown
	case moveUp
	case moveDown
	case entryChannel
	case outFromChannel
}
