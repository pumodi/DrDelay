//
//  ViewController.m
//  Dr Delay, PhD
//
//  Created by Jeff "ServerGuy" Brice on 11/17/13.
//  Copyright (c) 2013 Jeff Brice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tempoTextBox, calcResult, calcResult3, calcResult5, calcResultDot, noteValues, noteImage, noteImage2, dotImage, triplet, fiveTuplet;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tempoTextBox = nil;
    self.calcResult = nil;
    self.calcResult3 = nil;
    self.calcResult5 = nil;
    self.calcResultDot = nil;
    self.noteValues = nil;
    self.noteImage = nil;
    self.noteImage2 = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tempoConvert:(id)sender
{
    [tempoTextBox resignFirstResponder];
    // Basic Tempo Calculation
    double tempo = [tempoTextBox.text doubleValue];
    double ms = floor(60000 / tempo);
    
    if (tempo == 0 || tempo < 0) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Tempo cannot be 0"
                                                          message:@"Please use a number greater than 0"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    
    if (tempo > 60000) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Tempo cannot be greater than 60,000"
                                                          message:@"Please use a smaller number"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    
    // Checks the Note Value as defined in UISegmentController. If value other than 1/4 is selected divide by that value.
    else {
        switch (noteValues.selectedSegmentIndex)
        {
            case 0:
                ms = (ms * 4);
                [noteImage setImage:[UIImage imageNamed:@"whole.png"] forState:UIControlStateNormal];
                [noteImage2 setImage:[UIImage imageNamed:@"whole.png"] forState:UIControlStateNormal];
                break;
            case 1:
                ms = (ms * 2);
                [noteImage setImage:[UIImage imageNamed:@"half.png"] forState:UIControlStateNormal];
                [noteImage2 setImage:[UIImage imageNamed:@"half.png"] forState:UIControlStateNormal];
                break;
            case 2:
                ms = (ms * 1);
                [noteImage setImage:[UIImage imageNamed:@"quarter.psd"] forState:UIControlStateNormal];
                [noteImage2 setImage:[UIImage imageNamed:@"quarter.psd"] forState:UIControlStateNormal];
                break;
            case 3:
                ms = (ms / 2);
                [noteImage setImage:[UIImage imageNamed:@"eighth.png"] forState:UIControlStateNormal];
                [noteImage2 setImage:[UIImage imageNamed:@"eighth.png"] forState:UIControlStateNormal];
                break;
            case 4:
                ms = (ms / 4);
                [noteImage setImage:[UIImage imageNamed:@"sixteenth.png"] forState:UIControlStateNormal];
                [noteImage2 setImage:[UIImage imageNamed:@"sixteenth.png"] forState:UIControlStateNormal];
                break;
            case 5:
                ms = (ms / 8);
                [noteImage setImage:[UIImage imageNamed:@"thirtySecond_.png"] forState:UIControlStateNormal];
                [noteImage2 setImage:[UIImage imageNamed:@"thirtySecond_.png"] forState:UIControlStateNormal];
                break;
            case 6:
                ms = (ms / 16);
                [noteImage setImage:[UIImage imageNamed:@"sixtyFourth.png"] forState:UIControlStateNormal];
                [noteImage2 setImage:[UIImage imageNamed:@"sixtyFourth.png"] forState:UIControlStateNormal];
                break;
        }
    }
    
    // Used to calculate values for Triplets, Fivetuplets and Dotted notes
    double msTriple = floor(ms / 3);
    double msFifth = floor(ms / 5);
    double msDot = floor(ms * 1.5);
    double tripleVal = 3;
    double fiveVal = 5;
    
    [tempoTextBox resignFirstResponder];
    
    // Convert data to strings & push data to the proper fields
    NSString *convertResult = [[NSString alloc] initWithFormat: @"%.0f", ms];
    NSString *convertResult3 = [[NSString alloc] initWithFormat: @"%.0f", msTriple];
    NSString *convertResult5 = [[NSString alloc] initWithFormat: @"%.0f", msFifth];
    NSString *convertResultDot = [[NSString alloc] initWithFormat: @"%.0f", msDot];
    NSString *tripleConvert = [[NSString alloc] initWithFormat:@"%.0f", tripleVal];
    NSString *fiveConvert = [[NSString alloc] initWithFormat:@"%.0f", fiveVal];
    calcResult.text = convertResult;
    calcResult3.text = convertResult3;
    calcResult5.text = convertResult5;
    calcResultDot.text = convertResultDot;
    triplet.text = tripleConvert;
    fiveTuplet.text = fiveConvert;
    [dotImage setImage:[UIImage imageNamed:@"dot.png"] forState:UIControlStateNormal];
}

- (void)clearFields:(id)sender {
    calcResult.text = nil;
    calcResult3.text = nil;
    calcResult5.text = nil;
    calcResultDot.text = nil;
    triplet.text = nil;
    fiveTuplet.text = nil;
    tempoTextBox.text = nil;
    [dotImage setImage:[UIImage imageNamed:@"blank.png"] forState:UIControlStateNormal];
    [noteImage setImage:[UIImage imageNamed:@"blank.png"] forState:UIControlStateNormal];
    [noteImage2 setImage:[UIImage imageNamed:@"blank.png"] forState:UIControlStateNormal];
    
}

- (void)textFieldReturn:(id)sender {
    [tempoTextBox resignFirstResponder];
}

- (void)dismissKeyboard:(id)sender {
    [tempoTextBox resignFirstResponder];
    
}

@end
