//
//  Calculator.swift
//  BillCalculator
//
//  Created by Marina Aguiar on 4/28/21.
//

import UIKit

struct BillCalculator {
    
    func calculateBill(amount: Double, tip: Int, people: Int ) -> Double {
        
        let tipPercentage: Double = Double(tip) / 100
        let result = (amount + (amount * (tipPercentage))) / Double(people)
        return result

    }
}
