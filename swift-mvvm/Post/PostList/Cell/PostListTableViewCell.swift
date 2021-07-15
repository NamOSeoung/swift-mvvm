//
//  PostListTableViewCell.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit

//포스트 리스트 전용 Cell
extension PostListTableViewCell {
    
    func setupViews() {
        
        let cellWrap = UIView().chain
            .add(to: contentView)
            .setBackground(color: colorSetting(r: 255, g: 255, b: 255, alpha: 1))
            .constrain({ maker in
                maker.left.right.top.bottom.equalToSuperview()
            })
            .origin
      
        titleGL = UILabel().chain
            .add(to: cellWrap)
            .setText("")
            .setFont(.semiBold, aspectRatio(designSize: 16))
            .setTextColor(colorSetting(r: 51, g: 51, b: 51, alpha: 1))
            .setTextAlignment(.left)
            .setNumberOfLines(1)
            .constrain{ [unowned self] maker in
                let top = constraintRatio(direction: .top, designSize: 20)
                let left = constraintRatio(direction: .left, designSize: 22)
                maker.left.equalToSuperview().offset(left)
                maker.right.equalToSuperview().offset(-left)
                maker.top.equalToSuperview().offset(top)
            }.origin
        
        contentGL = UILabel().chain
            .add(to: cellWrap)
            .setText("")
            .setFont(.regular, aspectRatio(designSize: 16))
            .setTextColor(colorSetting(r: 51, g: 51, b: 51, alpha: 1))
            .setTextAlignment(.left)
            .setNumberOfLines(2)
            .setLineHeight(lineHeight: aspectRatio(designSize: 20.98))
            .constrain{ [unowned self] maker in
                let left = constraintRatio(direction: .left, designSize: 22)
                let bottom = constraintRatio(direction: .bottom, designSize: 20)
                let top = constraintRatio(direction: .top, designSize: 16)
                maker.left.equalToSuperview().offset(left)
                maker.right.equalToSuperview().offset(-left)
                maker.top.equalTo(titleGL.snp.bottom).offset(top)
                maker.bottom.equalToSuperview().offset(-bottom)
            }.origin
        
        _ = UIView().chain
            .add(to: cellWrap)
            .size(height: aspectRatio(designSize: 0.5))
            .setBackground(color: colorSetting(r: 222, g: 222, b: 222, alpha: 1))
            .constrain{ maker in
                maker.left.bottom.right.equalToSuperview()
            }.origin
    }
}

/*
 UIKit -> SwiftUI 변환
 Xcode Previews 기능
 */
#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct PostListTableViewCellRepresentble: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView { PostListTableViewCell().contentView }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PostListTableViewCellRepresentble>) {
    }
    
}
@available(iOS 13.0, *)
struct PostListTableViewCellPreview: PreviewProvider {
    static var previews: some View { Group {
        PostListTableViewCellRepresentble()
            .frame(width: 375, height: 130)
            .previewLayout(.sizeThatFits)

    } }
}
#endif
