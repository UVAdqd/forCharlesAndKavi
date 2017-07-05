//
//  AddActivityDelegate.swift
//  ixLoc
//
//  Created by super Tony on 7/5/17.
//  Copyright © 2017 superTony. All rights reserved.
//

import Foundation

protocol  AddActivityDelegate {
    func didAddActivity(activity:Activity)
    func defaultName() -> String?
}
