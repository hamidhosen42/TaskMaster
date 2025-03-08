//
//  TaskView_Preview.swift
//  TaskMaster
//
//  Created by Project2Morrow on 8/3/25.
//

import SwiftUI


struct UIViewControllerPreview: UIViewControllerRepresentable {
    let viewController: () -> UIViewController

    init(_ viewController: @autoclosure @escaping () -> UIViewController) {
        self.viewController = viewController
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return viewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

// Preview for TaskViewController
struct TaskView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview(TaskViewController())
    }
}
