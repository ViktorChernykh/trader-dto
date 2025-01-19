//
//  DateType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 09.11.2024.
//

public enum DateType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "date_type"

	public var id: String { rawValue }

	case tillCancelation
	case tillEndSession
	case tillEndDate
	case tillDate

	public var description: String {
		switch self {
		case .tillCancelation:
			"till cancelation"
		case .tillEndSession:
			"till end session"
		case .tillEndDate:
			"till day end"
		case .tillDate:
			"till date"
		}
	}
}
