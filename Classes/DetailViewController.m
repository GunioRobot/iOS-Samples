/*
     File: DetailViewController.m 
 Abstract: Detail view showing more extended information running on the iPad. 
  Version: 1.0 
  
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple 
 Inc. ("Apple") in consideration of your agreement to the following 
 terms, and your use, installation, modification or redistribution of 
 this Apple software constitutes acceptance of these terms.  If you do 
 not agree with these terms, please do not use, install, modify or 
 redistribute this Apple software. 
  
 In consideration of your agreement to abide by the following terms, and 
 subject to these terms, Apple grants you a personal, non-exclusive 
 license, under Apple's copyrights in this original Apple software (the 
 "Apple Software"), to use, reproduce, modify and redistribute the Apple 
 Software, with or without modifications, in source and/or binary forms; 
 provided that if you redistribute the Apple Software in its entirety and 
 without modifications, you must retain this notice and the following 
 text and disclaimers in all such redistributions of the Apple Software. 
 Neither the name, trademarks, service marks or logos of Apple Inc. may 
 be used to endorse or promote products derived from the Apple Software 
 without specific prior written permission from Apple.  Except as 
 expressly stated in this notice, no other rights or licenses, express or 
 implied, are granted by Apple herein, including but not limited to any 
 patent rights that may be infringed by your derivative works or by other 
 works in which the Apple Software may be incorporated. 
  
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE 
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION 
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS 
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND 
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS. 
  
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL 
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, 
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED 
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), 
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE 
 POSSIBILITY OF SUCH DAMAGE. 
  
 Copyright (C) 2010 Apple Inc. All Rights Reserved. 
  
 */

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "ContentController.h"

@implementation DetailViewController

@synthesize textView, accessoryView,contentController;
@dynamic navBar;


#pragma mark -
#pragma mark View lifecycle

/**
 *
 */
- (void)viewDidLoad 
{ [super viewDidLoad];
  
  // Observe keyboard hide and show notifications to resize the text view appropriately.
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSettings:)   
                                               name:UIApplicationDidFinishLaunchingNotification 
                                             object:nil];
}


/**
 *
 */
- (void)viewDidUnload 
{ self.textView = nil;
  self.accessoryView = nil;
  
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidFinishLaunchingNotification object:nil]; 
  
  [super viewDidUnload];
}


#pragma mark -
#pragma mark Text view delegate methods
/**
 *
 */
- (BOOL)textViewShouldBeginEditing:(UITextView *)aTextView 
{
  
  /*
   * You can create the accessory view programmatically (in code), in the same nib file as the view controller's main view, 
   * or from a separate nib file. This example illustrates the latter; it means the accessory view is loaded lazily -- only if it is required.
   */
  
  if (textView.inputAccessoryView == nil) 
  {
    [[NSBundle mainBundle] loadNibNamed:@"AccessoryView" owner:self options:nil];
    // Loading the AccessoryView nib file sets the accessoryView outlet.
    textView.inputAccessoryView = accessoryView;    
    // After setting the accessory view for the text view, we no longer need a reference to the accessory view.
    self.accessoryView = nil;
  }
  
  return YES;
}


/**
 *
 */
- (BOOL)textViewShouldEndEditing:(UITextView *)aTextView
{ [aTextView resignFirstResponder];
  return YES;
}


#pragma mark -
#pragma mark Responding to keyboard events

/**
 *
 */
- (void)keyboardWillShow:(NSNotification *)notification 
{
}

/**
 *
 */
- (void)keyboardWillHide:(NSNotification *)notification 
{ 
}


#pragma mark -
#pragma mark Accessory view action

/**
 * When the accessory view button is tapped, add a suitable string to the text view
 */
- (IBAction)tappedMe:(id)sender 
{ NSMutableString* text          = [textView.text mutableCopy];
  NSRange          selectedRange = textView.selectedRange;
  
  [text replaceCharactersInRange:selectedRange withString:@"You tapped me.\n"];
  textView.text = text;
  [text release];
}


#pragma mark -
#pragma mark Memory management

/**
 *
 */
- (void)dealloc 
{ [[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:nil];
  [textView release];
  [super dealloc];
}

/**
 * this is called when the app finishes launching (i.e. UIApplicationDidFinishLaunchingNotification)
 */
- (void)updateSettings:(NSNotification *)notif
{
	// now change the app view's background color
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  
	switch ([appDelegate backgroundColor])
	{
		case blackBackColor:
			self.textView.backgroundColor = [UIColor blackColor];
			break;
			
		case whiteBackColor:
			self.textView.backgroundColor = [UIColor whiteColor];
			break;
      
		case blueBackColor:
			self.textView.backgroundColor = [UIColor blueColor];
			break;
	}
  
  
	switch ([appDelegate textColor])
	{
		case blue:
			self.textView.textColor = [UIColor blueColor];
			break;
			
		case red:
			self.textView.textColor = [UIColor redColor];
			break;
      
		case green:
			self.textView.textColor = [UIColor greenColor];
			break;
	}
}
@end
