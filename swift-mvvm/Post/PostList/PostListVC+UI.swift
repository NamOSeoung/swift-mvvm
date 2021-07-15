//
//  PostListVC+UI.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit

//포스트 리스트 화면세팅
extension PostListVC {
    
    func setupViews() {
        
        let headerWrap = UIView().chain
            .add(to: view)
            .setBackground(color: colorSetting(r: 255, g: 255, b: 255, alpha: 1))
            .size(height: aspectRatio(designSize: 87))
            .constrain{ maker in
                maker.left.top.right.equalToSuperview()
            }.origin
        
        _ = UILabel().chain
            .add(to: headerWrap)
            .setTextColor(colorSetting(r: 31, g: 31, b: 31, alpha: 1))
            .setText("게시글 리스트")
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
        
        postListTV = UITableView().chain
            .add(to: view)
            .setBackground(color: .white)
            .setSeparatorStyle(.none)
            .setKeyboardDismissMode(.onDrag)
            .setShowsVerticalScrollIndicator(false)
            .setShowsHorizontalScrollIndicator(false)
            .apply({ v in
                    v.register(PostListTableViewCell.self,forCellReuseIdentifier: "PostListTableViewCell")})
            .constrain{ maker in
                maker.top.equalTo(headerWrap.snp.bottom)
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
struct PostListVCRepresentble: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView { PostListVC().view }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PostListVCRepresentble>) {
    }
    
}
@available(iOS 13.0, *)
struct PostListVCPreview: PreviewProvider {
    static var previews: some View { Group {
        PostListVCRepresentble()
            .previewDevice("iPhone 11 Pro Max")
    } }
}
#endif
