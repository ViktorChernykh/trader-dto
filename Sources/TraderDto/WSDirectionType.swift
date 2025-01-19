//
//  WSDirectionType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 05.12.2024.
//

/// Describe a group of receivers.
public enum WSDirectionType: String, Codable, Sendable {
	public static let schema: String = "ws_direction_type"

	case all
	case group 			// Exclude this device
	case groupWithoutMe // Exclude all my Devices
	case meExcludeThis	// Exclude this device
	case meAll
	case thisDevice
}
