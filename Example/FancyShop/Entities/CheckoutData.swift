/* Copyright © 2019 Mastercard. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 =============================================================================*/

import Foundation

//MARK: URL Params
struct CheckoutDatakey {
    static let allowedCardTypes = "allowedCardTypes"
    static let cartId = "cartId"
    static let currency = "currency"
    static let checkoutId = "checkoutId"
    static let locale = "locale"
    static let amount = "amount"
}

class CheckoutData : NSObject {
    
    //the merchant checkout id
    var checkoutId : String = ""
    
    //the allowed card types by merchant
    var allowedCardTypes : [CardConfiguration] = []
    
    //the cartId of the consumer generated by merchant
    var cartId : String = ""
    
    //the country currency Code.
    var currency : String = ""
    
    //the wallet locale
    var locale : String = ""
    
    //the cart subtotal amount
    var amount : String = ""
 
    //the  URL path component
    let urlPath : String = "/api/web-checkout"
    
    override init() {
          super.init()
    }
    
    func dictionaryRepresention() -> Dictionary<String,Any> {
        var dict : Dictionary<String,Any> = [:]
        dict[CheckoutDatakey.checkoutId] = self.checkoutId
        dict[CheckoutDatakey.allowedCardTypes] = self.getSelectedCardBrands().joined(separator: ",")
        dict[CheckoutDatakey.amount] = self.amount
        dict[CheckoutDatakey.cartId] = self.cartId
        dict[CheckoutDatakey.locale] = self.locale
        dict[CheckoutDatakey.currency] = self.currency
        return dict
    }
    
    func getSelectedCardBrands() -> [String] {
        var allowCardsName : [String] = []
        for card in self.allowedCardTypes {
            if card.isSelected {
                allowCardsName.append(card.getcardBrandCode(cardtype:card.name ))
            }
        }
        return allowCardsName
    }

}
