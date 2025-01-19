//
//  DealType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.05.2024.
//

/// Object for Deal Action Type.
public enum DealType: String, Codable, Sendable, CaseIterable, Identifiable {

	// MARK: Static properties
	public static let schema = "deal_type"
	
	public var id: String { rawValue }

	case buy
	case sell
	case closeShort
	case short
}
