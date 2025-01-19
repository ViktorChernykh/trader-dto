//
//  OrderPropertyType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 12.09.2024.
//

/// The behaviour of the application when placed in OrderBook. Used in Finam api.
/// Поведение заявки при выставлении в стакан.
public enum OrderPropertyType: Int, CaseIterable, Identifiable, Sendable {

	public var id: Int { self.rawValue }

	/// The residual of partially matched order is to stay in OrderBook.
	/// Не исполненная часть заявки помещается в очередь заявок биржи.
	case putInQueue = 1

	/// The residual of partially matched order is to be cancelled.
	/// Не исполненная часть заявки снимается с торгов.
	case cancelBalance = 2

	/// Filling the order only in case the posibility of immediate and full execution.
	/// Сделки совершаются только в том случае, если заявка может быть удовлетворена полностью и сразу при выставлении.
	case immOrCancel = 3

	public var description: String {
		switch self {
		case .putInQueue:
			"Не исполненную часть в очередь"
		case .cancelBalance:
			"Не исполненную часть снять"
		case .immOrCancel:
			"Исполнить только полностью"
		}
	}
}
