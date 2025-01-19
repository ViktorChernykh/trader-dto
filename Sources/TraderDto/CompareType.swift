//
//  CompareType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 09.11.2024.
//

import Foundation

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

	public var description: String {
		switch self {
		case .equal:
			"equal"
		case .less:
			"less"
		case .more:
			"more"
		case .across:
			"across"
		case .acrossUp:
			"across up"
		case .acrossDown:
			"across down"
		case .moveUp:
			"move up"
		case .moveDown:
			"move down"
		case .entryChannel:
			"entry to the channel"
		case .outFromChannel:
			"exit from the channel"
		}
	}

	public var localized: String {
		NSLocalizedString(rawValue, tableName: "Localizable", comment: "Text for the first option")
	}
}
