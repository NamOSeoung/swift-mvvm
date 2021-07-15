//
//  PostDetailVC+UI.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit

//포스트 상세 화면세팅
extension PostDetailVC {
    
    func setupViews() {
        
        let headerWrap = UIView().chain
            .add(to: view)
            .setBackground(color: colorSetting(r: 255, g: 255, b: 255, alpha: 1))
            .size(height: aspectRatio(designSize: 87))
            .constrain{ maker in
                maker.left.top.right.equalToSuperview()
            }.origin
        
        closeWrap = UIView().chain
            .add(to: headerWrap)
            .size(width: aspectRatio(designSize: 70), height: aspectRatio(designSize: 48))
            .constrain{ maker in
                maker.left.bottom.equalToSuperview()
            }.origin
        
        _ = UILabel().chain
            .add(to: closeWrap)
            .setTextColor(colorSetting(r: 31, g: 31, b: 31, alpha: 1))
            .setText("닫기")
            .setFont(.bold, aspectRatio(designSize: 17))
            .setTextAlignment(.center)
            .constrain{ [unowned self] maker in
                let bottom = constraintRatio(direction: .bottom, designSize: 12)
                maker.bottom.equalToSuperview().offset(-bottom)
                maker.centerX.equalToSuperview()
            }.origin
        
        _ = UILabel().chain
            .add(to: headerWrap)
            .setTextColor(colorSetting(r: 31, g: 31, b: 31, alpha: 1))
            .setText("게시글 상세보기")
            .setFont(.bold, aspectRatio(designSize: 17))
            .setTextAlignment(.center)
            .constrain{ [unowned self] maker in
                let bottom = constraintRatio(direction: .bottom, designSize: 12)
                maker.bottom.equalToSuperview().offset(-bottom)
                maker.centerX.equalToSuperview()
            }.origin
        
        _ = UIView().chain
            .add(to: headerWrap)
            .setBackground(color: colorSetting(r: 222, g: 222, b: 222, alpha: 1))
            .size(height: aspectRatio(designSize: 0.5))
            .constrain{ maker in
                maker.left.bottom.right.equalToSuperview()
            }.origin
        
        let contentWrap = UIView().chain
            .add(to: view)
            .setBackground(color: colorSetting(r: 255, g: 255, b: 255, alpha: 1))
            .constrain{ maker in
                maker.top.equalTo(headerWrap.snp.bottom)
                maker.left.right.bottom.equalToSuperview()
            }.origin
        
        titleGL = UILabel().chain
            .add(to: contentWrap)
            .setText("")
            .setFont(.semiBold, aspectRatio(designSize: 16))
            .setTextColor(colorSetting(r: 51, g: 51, b: 51, alpha: 1))
            .setTextAlignment(.left)
            .setNumberOfLines(0)
            .constrain{ [unowned self] maker in
                let top = constraintRatio(direction: .top, designSize: 20)
                let left = constraintRatio(direction: .left, designSize: 22)
                maker.left.equalToSuperview().offset(left)
                maker.right.equalToSuperview().offset(-left)
                maker.top.equalToSuperview().offset(top)
            }.origin
        
        contentGL = UILabel().chain
            .add(to: contentWrap)
            .setText("")
            .setFont(.regular, aspectRatio(designSize: 16))
            .setTextColor(colorSetting(r: 51, g: 51, b: 51, alpha: 1))
            .setTextAlignment(.left)
            .setNumberOfLines(0)
            .setLineHeight(lineHeight: aspectRatio(designSize: 20.98))
            .constrain{ [unowned self] maker in
                let left = constraintRatio(direction: .left, designSize: 22)
                let top = constraintRatio(direction: .top, designSize: 16)
                maker.left.equalToSuperview().offset(left)
                maker.right.equalToSuperview().offset(-left)
                maker.top.equalTo(titleGL.snp.bottom).offset(top)
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
struct PostDetailVCRepresentble: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView { PostDetailVC().view }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PostDetailVCRepresentble>) {
    }
    
}
@available(iOS 13.0, *)
struct PostDetailVCPreview: PreviewProvider {
    static var previews: some View { Group {
        PostDetailVCRepresentble()
            .previewDevice("iPhone 11 Pro Max")
    } }
}
#endif
