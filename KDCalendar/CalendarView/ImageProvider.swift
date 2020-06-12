//
//  ImageProvider.swift
//  CalendarView
//
//  Created by Nguyễn Cường on 6/12/20.
//  Copyright © 2020 Karmadust. All rights reserved.
//

import Foundation
import UIKit

public class ImageProvider {
    // for any image located in bundle where this class has built
    public static func image(named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle(for:self), compatibleWith: nil)
    }
}
