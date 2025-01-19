//
//  SubjectType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 27.12.2024.
//

public enum SubjectType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "subject_type"

	public var id: String { rawValue }

	case price
	case value
	case ema7
	case ema14

	public var description: String {
		switch self {
		case .price:
			"Price:"
		case .value:
			"Value:"
		case .ema7:
			"Ema 7:"
		case .ema14:
			"Ema 14:"
		}
	}
}
