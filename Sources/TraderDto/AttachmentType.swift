//
//  AttachmentType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 04.10.2024.
//

/// Attachment type (image or file).
public enum AttachmentType: String, Codable, Sendable, CaseIterable, Identifiable {

	public var id: String { rawValue }

	// MARK: Static properties
	public static let schema: String = "attachment_type"

	case image
	case file
}
