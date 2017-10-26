/*
 * CalendarDayCell.swift
 * Created by Michael Michailidis on 02/04/2015.
 * http://blog.karmadust.com/
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import UIKit



class CalendarDayCell: UICollectionViewCell {
    
    override var description: String {
        let dayString = self.textLabel.text ?? " "
        return "<DayCell (text:\"\(dayString)\")>"
    }
    
    var eventsCount = 0 {
        didSet {
            self.dotsView.isHidden = (eventsCount == 0)
            self.setNeedsLayout()
        }
    }
    
    
    var isToday : Bool = false {
        
        didSet {
            if isToday == true {
                self.bgView.backgroundColor = CalendarView.Style.CellColorToday
            }
            else {
                self.bgView.backgroundColor = CalendarView.Style.CellColorDefault
            }
        }
    }
    
    override var isSelected : Bool {
        
        didSet {
            if isSelected == true {
                self.bgView.layer.borderColor = CalendarView.Style.CellBorderColor.cgColor
                self.bgView.layer.borderWidth = CalendarView.Style.CellBorderWidth
            }
            else {
                self.bgView.layer.borderColor = UIColor.clear.cgColor
                self.bgView.layer.borderWidth = 0.0
            }
            
        }
    }
    

    let textLabel   = UILabel()
    let dotsView    = UIView()
    let bgView      = UIView()
    
    override init(frame: CGRect) {
        
        self.textLabel.textAlignment = NSTextAlignment.center
        self.textLabel.textColor = UIColor.darkGray
        
        self.dotsView.backgroundColor = CalendarView.Style.CellBorderColor
        
        self.bgView.layer.cornerRadius = 4.0
        
        super.init(frame: frame)
        
        self.addSubview(self.bgView)
        self.addSubview(self.textLabel)
        
        self.addSubview(self.dotsView)
        
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let elementsFrame = self.bounds.insetBy(dx: 3.0, dy: 3.0)
        self.bgView.frame = elementsFrame
        self.textLabel.frame = elementsFrame
        
        let size = self.bounds.height * 0.08 // always a percentage of the whole cell
        self.dotsView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        self.dotsView.center = CGPoint(x: self.textLabel.center.x, y: self.bounds.height - (2.5 * size))
        self.dotsView.layer.cornerRadius = size * 0.5 // round it

        
        
    }
    
}

