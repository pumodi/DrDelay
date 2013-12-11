//
//  ViewController.h
//  Dr Delay, PhD
//
//  Created by Jeff "ServerGuy" Brice on 11/17/13.
//  Copyright (c) 2013 Jeffrey Brice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    UITextField *tempoTextBox;
    UILabel     *calcResult;
    UILabel     *calcResult3;
    UILabel     *calcResult5;
    UILabel     *calcResultDot;
    UISegmentedControl  *noteValues;
    UILabel     *tiplet;
    UILabel     *fiveTuplet;
}
@property (nonatomic, retain) IBOutlet UILabel *calcResult;
@property (nonatomic, retain) IBOutlet UILabel *calcResult3;
@property (nonatomic, retain) IBOutlet UILabel *calcResult5;
@property (nonatomic, retain) IBOutlet UILabel *calcResultDot;
@property (nonatomic, retain) IBOutlet UITextField *tempoTextBox;
@property (nonatomic, retain) IBOutlet UISegmentedControl *noteValues;
@property (nonatomic, retain) IBOutlet UIButton *noteImage;
@property (nonatomic, retain) IBOutlet UIButton *noteImage2;
@property (nonatomic, retain) IBOutlet UIButton *dotImage;
@property (nonatomic, retain) IBOutlet UILabel *triplet;
@property (nonatomic, retain) IBOutlet UILabel *fiveTuplet;
@property (nonatomic, retain) IBOutlet UIButton *resetButton;
@property (nonatomic) double tempo;
@property (nonatomic) double ms;
@property (nonatomic) double msTriple;
@property (nonatomic) double msFifth;
@property (nonatomic) double msDot;
@property (nonatomic) double tripleVal;
@property (nonatomic) double fiveVal;

- (IBAction)tempoConvert:(id)sender;
- (IBAction)clearFields:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
