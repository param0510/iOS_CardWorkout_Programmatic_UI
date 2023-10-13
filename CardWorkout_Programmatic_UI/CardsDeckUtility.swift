//
//  cardsUtility.swift
//  CardWorkoutGame
//
//  Created by param  on 2023-05-17.
//

//import Foundation

// Can improve this by using a library which directly accesses the assets archive
class CardsDeckUtility{
    
    static func getCardsNameList() -> [String]
    {
        var cardsNameArray: [String] = []
        for i in 1...13
        {
            for j in "CDHS"{
                if i == 1{
                    cardsNameArray.append("A\(j)")
                }
                else if i == 11{
                    cardsNameArray.append("J\(j)")
                }
                else if i == 12{
                    cardsNameArray.append("Q\(j)")
                }
                else if i == 13{
                    cardsNameArray.append("K\(j)")
                }
                else{
                    cardsNameArray.append("\(i)\(j)")
                }
            }
        }
        
        return cardsNameArray
    }
}
