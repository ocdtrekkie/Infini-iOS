//
//  PageSwitcher.swift
//  Infini-iOS
//
//  Created by Alex Emry on 8/12/21.
//

import Foundation

enum Page {
	case dfu
	case status
	case settings
	case home
	case debug // MARK: logging
}

class PageSwitcher: ObservableObject {
	static let shared = PageSwitcher()
	
	@Published var currentPage: Page = .home
	@Published var showMenu: Bool = false
	
}


