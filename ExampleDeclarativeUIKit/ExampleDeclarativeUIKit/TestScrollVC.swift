//
//  TestScrollVC.swift
//  ExampleDeclarativeUIKit
//
//  Created Vinova Dev on 4/23/20.
//  Copyright © 2020 phthphat. All rights reserved.
//
//  Template generated by phthphat
//

import UIKit

class TestScrollVC: UIViewController {

	override func viewDidLoad() {
        super.viewDidLoad()
    }

}


#if DEBUG
import SwiftUI
struct PresentableTestScrollVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TestScrollVC {
		let vc = TestScrollVC()
		return vc 
    }
    func updateUIViewController(_ uiViewController: TestScrollVC, context: Context) { }
}
struct TestScrollVCPreview: PreviewProvider {
    static var previews: some View {
        return PresentableTestScrollVC()
    }
}
#endif
