//
//  PermissionsView.swift
//
//

import SwiftUI
import AssessmentModel
import SharedMobileUI

struct PermissionsView: View {
    let node: ContentNode
    
    /// The fontRatio determines how big the image is (or whether or not it is hidden) based on the accessiblity size.
    @ScaledMetric private var fontRatio: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Only show the image if the font size is not extra large.
            if let imageName = node.imageName, fontRatio < 1.5 {
                Image(imageName, bundle: node.bundle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 210, alignment: .center)
                    .padding(.top, 10.0)
                    .padding(.horizontal, 0)
                    .padding(.bottom, 0)
            }
            Text(node.titleKey, bundle: node.bundle)
                .font(DesignSystem.fontRules.headerFont(at: 1))
                .padding(.top, 44.0)
                .padding(.bottom, 14.0)
                .padding(.horizontal, 60.0)
            Text(node.detailKey, bundle: node.bundle)
                .font(DesignSystem.fontRules.bodyFont(at: 1, isEmphasis: false))
                .padding(.horizontal, 56.0)
                .padding(.bottom, 14.0)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct PermissionsView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView(node: notificationsPermissionNode)
    }
}

let notificationsPermissionNode =
    InstructionStepObject(identifier: "notifications",
                          title: "Notifications",
                          detail: "We may send you periodic reminders or notifications on your phone to complete your activities.\n\nYou can choose to make it an alert, a sound, or an icon badge.\n\nYou can say no and still be in the study.",
                          imageInfo: FetchableImage(imageName: "permissions_notifications"))
