//
//  PortfolioDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 13.05.2024.
//

import struct Foundation.Date

public struct PortfolioDto: Codable, Sendable {

	// MARK: Stored properties
	public let id: Int
	public let date: Date
	public let secid: String
	public let quantity: Int
	public let price: Double
	public let cash: Double

	// MARK: - Init
	public init(
		id: Int,
		date: Date,
		secid: String,
		quantity: Int,
		price: Double,
		cash: Double
	) {
		self.id = id
		self.date = date
		self.secid = secid
		self.quantity = quantity
		self.price = price
		self.cash = cash
	}
}
