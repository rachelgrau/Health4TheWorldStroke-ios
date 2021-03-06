//
//  LegsViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/11/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LegsViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "VideoViewController.h"
#import "AWSDynamoDBHelper.h"

@interface LegsViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
        
@end

@implementation LegsViewController

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Strenghtening.legs", nil) uppercaseString];
    
    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(0, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *a1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Legs.toe", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [a1Button addRoundImageCentered:[UIImage imageNamed:LEGS_1A_TOE]];
    [a1Button addTarget:self action:@selector(a1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *b1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Legs.knee", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [b1Button addRoundImageCentered:[UIImage imageNamed:LEGS_1B_KNEE]];
    [b1Button addTarget:self action:@selector(b1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    //cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *c1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Legs.hip", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [c1Button addRoundImageCentered:[UIImage imageNamed:LEGS_1C_HIP]];
    [c1Button addTarget:self action:@selector(c1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview: a1Button];
    [self.contentView addSubview: b1Button];
    [self.contentView addSubview: c1Button];
    
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"BackButton", @"NA"]];
}


- (void)a1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = LEGS_TITLE_1A_TOE;
    [videoVC setUpVideo: VIDEO_1A_TOE_FLEXION];
    [self.navigationController pushViewController:videoVC animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Start",@"1A_Toe_Flexion", @"Video"]];
}

- (void)b1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = LEGS_TITLE_1B_KNEE;
    [videoVC setUpVideo: VIDEO_1B_KNEE_FLEXION];
    [self.navigationController pushViewController:videoVC animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Start",@"1B_Knee_Flexion", @"Video"]];
}

- (void)c1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = LEGS_TITLE_1C_HIP;
    [videoVC setUpVideo: VIDEO_1C_HIP_FLEXION];
    [self.navigationController pushViewController:videoVC animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Start",@"1C_Hip_Flexion", @"Video"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
