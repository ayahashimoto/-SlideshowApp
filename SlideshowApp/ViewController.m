//
//  ViewController.m
//  SlideshowApp
//
//  Created by 橋本 遥 on 2016/01/20.
//  Copyright © 2016年 aya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *aImageView;
    NSInteger countNumber;
}


@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    countNumber = 1;
    [self setupBackground];
    [self setupButton];


}

   // 背景画像の表示
-(void)setupBackground{
    aImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    aImageView.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:aImageView];
}

-(void)setupButton{
// サイズ・位置を指定してボタンを作る（※バックボタン）
UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
aButton.frame = CGRectMake(0, 0, 90, 90);
aButton.center = CGPointMake(80, 430);
[aButton setImage:[UIImage imageNamed:@"b1.png"] forState:UIControlStateNormal];
[aButton setImage:[UIImage imageNamed:@"b2.png"] forState:UIControlStateHighlighted];
// ボタンで呼び出すメソッドとその操作を指定
[aButton addTarget:self action:@selector(changeImageUsingnIfB:) forControlEvents:UIControlEventTouchUpInside];
// 画面にボタンを貼り付ける
[self.view addSubview:aButton];


// サイズ・位置を指定してボタンを作る（※ネクストボタン）
UIButton *bButton = [UIButton buttonWithType:UIButtonTypeCustom];
bButton.frame = CGRectMake(0, 0, 90, 90);
bButton.center = CGPointMake(250, 430);
[bButton setImage:[UIImage imageNamed:@"n1.png"] forState:UIControlStateNormal];
[bButton setImage:[UIImage imageNamed:@"n2.png"] forState:UIControlStateHighlighted];
// ボタンで呼び出すメソッドとその操作を指定
[bButton addTarget:self action:@selector(changeImageUsingnIfN:) forControlEvents:UIControlEventTouchUpInside];
// 画面にボタンを貼り付ける
[self.view addSubview:bButton];
}


// バックボタン用の命令
-(void)changeImageUsingnIfB:(id)sender{
    countNumber--;
    if(countNumber == 0){
        countNumber = 3;
    }
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",(long)countNumber]];
}


// ネクストボタン用の命令
-(void)changeImageUsingnIfN:(id)sender{
    countNumber++;
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",(long)countNumber]];
    if (countNumber==3) {
    countNumber = 0;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
