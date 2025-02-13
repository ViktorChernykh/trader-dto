//
//  LineType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 26.08.2024.
//

public enum LineType: String, Codable, Sendable, CaseIterable, Identifiable {

	// MARK: Static properties
	public static let schema: String = "line_type"

	public var id: String { rawValue }

	case draw
	case horizontal
	case vertical
	case fibonacci
	case text
	case ruler
	case none
}
