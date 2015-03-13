# Software Development Design #

## 6.1 Introduction ##

This document presents the architecture and detail design for the Mobile Musician iPod Application.  This project is an application for creating music by pressing buttons containing a different note (pressing the button will play the note).

### 6.1.1 System Objectives ###

Mobile Musician is meant to be a sort of “pocket inspiration” for musicians who need it (or just a way of making noise for people who enjoy that sort of thing).  The main view is a grid of buttons that may be arranged according to scale and also, randomized.  Some popular scales will be provided as well as the ability to create user-defined ones.  The application will also have a very simple record and playback feature.

### 6.1.2 Hardware, Software, and Human Interfaces ###

**6.1.2.1 OpenAl 1.0:**  OpenAl is a third party library for playing and manipulating sounds in iOs.  It will be used to play sounds and change the pitch of existing sounds.  This will cut down on memory so I don't have to store every possible note.  The idea is to have a few notes from an instrument and use OpenAl to fill in the rest via pitch changing.

**6.1.2.2 SoundBankPlayer:** SoundBankPlayer is third party software from hollance.com that does the work needed to communicate with OpenAl.  You give it a .plist file and some samples from the instrument and creating a new SoundBank takes care of the notes for you.  You then give it a midi number and it plays that note.

**6.1.2.3 Model-View-Controller:**  Since this project follows a strict Model-View-Controller architecture,  most of the internal software interfaces are the interaction  between the view and their associated controllers, as well as the model and the controllers.

**6.1.2.4 OCUnit:** Some automated tests need to be run on the logic of the Note and Scale Classes.  This will be accomplished through use of the OCUnit Testing Framework, which provides methods for assertions.

## 6.2 Architecture Design ##

Since Mobile Musician follows a Model-View-Controller architecture, the classes are divided into the different view files for GUI layout, view controllers to handle input from the GUI, and the model for logic behind the notes and scales.

### 6.2.1 Major Software Components ###

As stated before, this project follows Mode-View-Controller approach, and the software is divided accordingly.  The Model, MobileMusicianModel CSC, contains all of the logic and functions unrelated to the GUI.  The MobileMusicianView CSC is  responsible for the layout of the GUI, mostly through xib (interface builder) files.  The MobileMusicianViewController CSC handle input received through the GUI.

### 6.2.2 Major Software Interactions ###

As mentioned in the previous section, the view and the controller associated with them will do a majority of the interacting.  The controller also interacts with the model code, making the controller a bridge between the model and the view.  The model code also interacts with the OpenAl libraries mainly to play and change the pitch of sounds.

### 6.2.3 Architectural Design Diagrams ###

**6.2.3.1 Top Level Diagram**

See Top Level Diagram in [Downloads](http://code.google.com/p/mobile-musician/downloads/list)

**6.2.3.2 Use Case Diagram**

See Use Case Diagram in [Downloads](http://code.google.com/p/mobile-musician/downloads/list)

## 6.3 CSC and CSU Description ##

Unsurprisingly, the three CSC's of the project are the “Mobile Musician Models,” “Mobile Musician View Controllers,” and “Mobile Musician View.”  In the model CSC, the classes are Note, Scale, Recorder, and SoundPlayer.  In the views CSC, the CSUs are NoteView, MenuView, ChangeScaleView, and CreateScaleView.  There is one controller for each view, so there is the NoteViewController, MenuViewController, ChangeScaleViewController, and the CreateScaleViewController.

### 6.3.1 Detailed Class Descriptions ###

The following sections provide the details of Mobile Musician.

> 6.3.1.1 Note

> The Note class is a representation of a musical note.

> Fields:
    * name: The name of the note as an enum.
    * pitch: A double representing the pitch of the note

> Methods:
    * playMe: Plays the sound.
    * stepUp: Takes in a number of half steps and returns the note that many half steps up.
    * stepDown: Same as stepUp but returns the note that many half steps down.

> 6.3.2.2 SoundBankPlayer

> Wrapper around OpenAl to play sound.

> Methods:
    * play: Plays a note based on the midi number passed.

> 6.3.2.3 Scale

> A class representing a scale of notes.

> Fields:
    * steps:  A list of integers that represent the number of halfsteps needed to create the scale.  (Two
    * root:  The current root or home note.

> Methods:
    * changeRoot: Changes the root.
    * getNotes: Returns a list of notes based on the root and the steps.

> 6.3.2.4 Recorder

> Class to record and playback sounds.

> Fields:
    * sound: Currently recorded sound.

> Methods:
    * record: Records a sequence of notes.
    * play: Plays the recorded sound.

> 6.3.2.5 NoteViewController

> Hanldes input from the Note screen.

> Fields:
    * scale: The currently selected scale.
    * recorder: For recording sequences.

> Methods:
    * notePressed: Method to handle a note button being pressed.
    * MenuPressed: Method to handle the menu button being pressed.
    * RecordPressed: Method to handle record being pressed.

> 6.3.2.6 MenuViewController

> Handles input from the Menu View.

> Methods:
    * rootChanged: Handles a new root being entered.
    * changeScalePressed: Handles the changeScale button being pressed.
    * showNotes: Handles the button that toggles whether note names are shown.
    * buttonSizePressed: Handles the button size button being pressed.
    * quitButtonPressed: Handles the quit button being pressed.

> 6.3.2.7 ChangeScaleViewController

> Handles the input from the ChangeScaleView.

> Fields:
    * predefinedScales:  A list of scales that are predefined.

> Methods:
    * scalePressed: Handles a scale button being pressed.
    * createNewPressed: Handles the createNewScale button being pressed.

> 6.3.2.8 CustomScaleViewController

> Handles the input from the CreateScaleView class.

> Fields:
    * userScale: The scale the user created.

> Methods:
    * scaleButtonPressed:  Handles a scale button being pressed.
    * scaleFromButtons: Creates a scale from the buttons activated.
    * quitButtonPressed: Handles the quit button being pressed.

### 6.3.3 Detailed Interface Descriptions ###

There are no interfaces in this project.

### 6.3.4 Detailed Design Diagrams ###

See Downloads for all diagrams.

## 6.4 Database Design and Description ##

Since there is minimal persistence in this application, there is no database.