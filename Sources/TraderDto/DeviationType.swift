//
//  DeviationType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 09.11.2024.
//

public enum DeviationType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "deviation_type"

	public var id: String { rawValue }
	
	case value
	case percent
}
