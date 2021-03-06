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
import UIKit
import NVActivityIndicatorView


/// Base view controller, used to use common methods
class BaseViewController: UIViewController, NVActivityIndicatorViewable{
    
    /// Shows an alert on top of the current view controller
    ///
    /// - Parameters:
    ///   - message: String with the message
    ///   - title: String with the title
    ///   - handler: Block of code to execute when the user clicks on a
    func showErrorInAlert(message: String = "", title: String = "", handler: ((UIAlertAction) -> Swift.Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reloadData(){
        
    }
    
    /// Sets a message in a label if the collection view has no items to show
    ///
    /// - Parameters:
    ///   - collectionView: Collectionview where the items are going to be shown
    ///   - array: array of items to be shown
    ///   - emptyMessage: String with the empty message
    func setupEmptyMessageIfNeeded(collectionView: UICollectionView, array: [Any], emptyMessage: String!) {
        collectionView.backgroundView = nil
        if (!(array.count > 0)){
            let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
            noDataLabel.text          = emptyMessage
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            collectionView.backgroundView  = noDataLabel
        }
    }
    
    /// Animates the passed view
    ///
    /// - Parameters:
    ///   - view: View to animate
    ///   - duration: duration of the animation
    func animateView(view:UIView, duration: TimeInterval){
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .beginFromCurrentState,
            animations: { () -> Void in
                view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (completed:Bool) -> Void in
            UIView.animate(
                withDuration: duration,
                delay: 0,
                options: .beginFromCurrentState,
                animations: { () -> Void in
                    view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }) { (completed:Bool) -> Void in
            }
        }
    }
}
