//
//  ScrollView.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/6/24.
//

import Foundation
import SnapKit
import UIKit

final class ScrollView: UIViewController {
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    private var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        
        return view
    }()
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        
        return view
    }()
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    private var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    private var purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(337)
        }
        orangeView.snp.makeConstraints { make in
            make.top.trailing.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(337)
        }
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.leading.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(337)
        }
        greenView.snp.makeConstraints { make in
            make.top.equalTo(orangeView.snp.bottom)
            make.trailing.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(337)
        }
        blueView.snp.makeConstraints { make in
            make.top.equalTo(yellowView.snp.bottom)
            make.leading.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(337)
        }
        purpleView.snp.makeConstraints { make in
            make.top.equalTo(greenView.snp.bottom)
            make.trailing.equalTo(contentView)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(337)
            make.bottom.equalTo(contentView)
        }
    }
}
