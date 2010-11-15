/*
 File: AppListViewController.m 
 Abstract: Controller for the main table view of this sample sample.
 This table view controller works off the AppDelege's data model.
 produce a three-stage lazy load:
 1. No data (i.e. an empty table)
 2. Text-only data from the model's RSS feed
 3. Images loaded over the network asynchronously
 
 This process allows for asynchronous loading of the table to keep the UI responsive.
 Stage 3 is managed by the AppRecord corresponding to each row/cell.
 
 Images are scaled to the desired height.
 If rapid scrolling is in progress, downloads do not begin until scrolling has ended.
 
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

#import "AppDelegate.h"
#import "NoteListViewController.h"
#import "ContentController.h"

#define kCustomRowHeight    60.0
#define kCustomRowCount     7

#pragma mark -

@implementation NoteListViewController

@synthesize contentController;


#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.tableView.rowHeight = kCustomRowHeight;
  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  
}

- (void)dealloc
{
  [contentController release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}


#pragma mark -
#pragma mark Table view creation (UITableViewDataSource)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  /*
   if (entries != nil && entries.count > 0)
   {
   AppRecord *app = [entries objectAtIndex:indexPath.row];
   contentController.detailItem = app;
   }
   */
}

// customize the number of rows in the table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	int count = 0;
  
  /*  
   [entries count];
   
   // if there's no data yet, return enough rows to fill the screen
   if (count == 0)
   count = kCustomRowCount;
   */
  
  return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// customize the appearance of table view cells
	//
	static NSString *CellIdentifier = @"LazyTableCell";
  static NSString *PlaceholderCellIdentifier = @"PlaceholderCell";
  
  // add a placeholder cell while waiting on table data
  int nodeCount = 0; // [self.entries count];
	
	if (nodeCount == 0 && indexPath.row == 0)
	{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PlaceholderCellIdentifier];
    if (cell == nil)
		{
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:PlaceholderCellIdentifier] autorelease];   
      cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
		cell.detailTextLabel.text = @"Loading…";
		
		return cell;
  }
  
  return nil;
  
/*  
	
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil)
	{
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                   reuseIdentifier:CellIdentifier] autorelease];
  }
  
  // Leave cells empty if there's no data yet
  if (nodeCount > 0)
	{
    // Set up the cell...
    AppRecord *appRecord = [self.entries objectAtIndex:indexPath.row];
    
		cell.textLabel.text = appRecord.appName;
    cell.detailTextLabel.text = appRecord.artist;
		
    // Only load cached images; defer new downloads until scrolling ends
    if (!appRecord.appIcon)
    {
      if (self.tableView.dragging == NO && self.tableView.decelerating == NO)
      {
        [self startIconDownload:appRecord forIndexPath:indexPath];
      }
      // if a download is deferred or in progress, return a placeholder image
      cell.imageView.image = [UIImage imageNamed:@"Placeholder.png"];                
    }
    else
    {
      cell.imageView.image = appRecord.appIcon;
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  
  return cell;
 */
}


#pragma mark -
#pragma mark Deferred image loading (UIScrollViewDelegate)

// Load images for all onscreen rows when scrolling is finished
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
  
}

@end