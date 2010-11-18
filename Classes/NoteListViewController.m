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
#import "Note.h"
#import "NoteListViewController.h"
#import "ContentController.h"

#define kCustomRowHeight    60.0
#define kCustomRowCount     7

#pragma mark -

@implementation NoteListViewController

@synthesize contentController,fetchedResultsController;


#pragma mark -
#pragma mark UIViewController

/**
 *
 */
- (void)awakeFromNib
{ NSLog(@"NoteListViewController.awakeFromNib()");
  
  dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
  [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
}

/**
 *
 */
- (void)viewDidLoad
{ [super viewDidLoad];
  
  self.tableView.rowHeight = kCustomRowHeight;
  
  NSError *error = nil;
  
	if( ![[self fetchedResultsController] performFetch:&error] ) 
  { NSLog(@"Unresolved error %@, %@", error, [error userInfo]);

		abort();
	}	
}

/**
 *
 */
- (void)viewDidUnload
{ [super viewDidUnload]; }

/**
 *
 */
- (void)dealloc
{ [contentController release];
  [dateFormatter release];
  
  [super dealloc];
}

/**
 *
 */
- (void)didReceiveMemoryWarning
{ [super didReceiveMemoryWarning]; }

/**
 *
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{ return YES; }


#pragma mark -
#pragma mark Table view creation (UITableViewDataSource)

/**
 *
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ Note* note = (Note *)[fetchedResultsController objectAtIndexPath:indexPath];
  
  contentController.note = note;
}

/**
 *
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{ NSInteger count = [[fetchedResultsController sections] count];
  
	if (count == 0) 
		count = 1;
	
  return count;
}


/**
 *
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{ NSInteger numberOfRows = 0;
	
  if ([[fetchedResultsController sections] count] > 0) 
  { id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
  
    numberOfRows = [sectionInfo numberOfObjects];
  }
  
  return numberOfRows;
}

/**
 *
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ static NSString *PlaceholderCellIdentifier = @"PlaceholderCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PlaceholderCellIdentifier];
  if (cell == nil)
	{ cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:PlaceholderCellIdentifier] autorelease];   
      
    cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  } // of if

  Note* note = (Note *)[fetchedResultsController objectAtIndexPath:indexPath];

  if( note!=nil )
  { cell.detailTextLabel.text = [dateFormatter stringFromDate:note.created];
    cell.textLabel.text       = note.title;
  }
  else 
  { cell.detailTextLabel.text = @"Details";
    cell.textLabel.text       = @"aa";
  }
			
  return cell;
}


#pragma mark -
#pragma mark Deferred image loading (UIScrollViewDelegate)

/**
 *  Load images for all onscreen rows when scrolling is finished
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{ }

/**
 *
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{ }


#pragma mark -
#pragma mark Fetched results controller
/**
 *
 */
-(void)saveData
{ NSManagedObjectContext* context = contentController.managedObjectContext;
  NSError* error=nil;
  
  if( ![context save:&error] ) 
  { NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    
    abort();
  } // of if
} // of if

/**
 *
 */
-(void)addNote:(NSString*)noteText andTitle:(NSString*) title
{ NSManagedObjectContext* context = contentController.managedObjectContext;
  Note*                   note    = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:context];
  NSManagedObject*        text    = [NSEntityDescription insertNewObjectForEntityForName:@"Text" inManagedObjectContext:context];
  
  note.title   = title;
  note.created = [NSDate date];
  note.text    = text;
  
  // Set the image for the image managed object.
  [text setValue:noteText forKey:@"data"];
  [text setValue:note     forKey:@"note"];
} // of addNote()

/**
 *
 */
- (NSFetchedResultsController *)fetchedResultsController 
{
  // Set up the fetched results controller if needed.
  if( fetchedResultsController==nil ) 
  { NSManagedObjectContext* context = contentController.managedObjectContext;
    
    // Create the fetch request for the entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor* sortDescriptor  = [[NSSortDescriptor alloc] initWithKey:@"created" ascending:NO];
    NSArray*          sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
                                                                                                managedObjectContext:context 
                                                                                                  sectionNameKeyPath:nil 
                                                                                                           cacheName:@"Root"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;

    int sectionCount = [[aFetchedResultsController sections] count];
    
    if( sectionCount<1 )
    { 
      [self addNote:@"Das ist das Haus" andTitle:@"Das Haus"];
      [self addNote:@"und nebendran vom Weihnachtsmann" andTitle:@"Vom Nikolaus"];
      
      [self saveData];
      
      NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
                                                                                                  managedObjectContext:context 
                                                                                                    sectionNameKeyPath:nil 
                                                                                                             cacheName:@"Root"];
      aFetchedResultsController.delegate = self;
      self.fetchedResultsController = aFetchedResultsController;      
    } // of if

    [fetchRequest release];
    [sortDescriptor release];
    [sortDescriptors release];
  } // of if
	
	return fetchedResultsController;
} // of fetchedResultsController()



/**
 * Delegate methods of NSFetchedResultsController to respond to additions, removals and so on.
 */
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller 
{
	// The fetch controller is about to start sending change notifications, so prepare the table view for updates.
	[self.tableView beginUpdates];
}

/**
 *
 */
- (void)controller:(NSFetchedResultsController *)controller 
   didChangeObject:(id)anObject 
       atIndexPath:(NSIndexPath *)indexPath 
     forChangeType:(NSFetchedResultsChangeType)type 
      newIndexPath:(NSIndexPath *)newIndexPath 
{
	UITableView *tableView = self.tableView;
	
	switch(type) 
  {
		case NSFetchedResultsChangeInsert:
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeUpdate:
			//[self configureCell:(RecipeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
			break;
			
		case NSFetchedResultsChangeMove:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]    withRowAnimation:UITableViewRowAnimationFade];
      [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
      break;
	}
}

/**
 *
 */
- (void)controller:(NSFetchedResultsController *)controller 
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo 
           atIndex:(NSUInteger)sectionIndex 
     forChangeType:(NSFetchedResultsChangeType)type 
{
	switch(type) 
  {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}

/**
 *
 */
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller 
{
	// The fetch controller has sent all current change notifications, so tell the table view to process all updates.
	[self.tableView endUpdates];
}

@end