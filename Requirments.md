# Requirements Document for Mobile Musician #

## 5.1 Introduction ##

> Mobile Musician is an application for the iPod Touch or iPhone that consists of a grid of square buttons that, when touched or slid into from another square, play a note. The grid, whose dimensions  depend on the size of each button (chosen by the user), will each contain a different note and will be arranged so that, starting in the top left corner and sliding a finger to the right, down, and back to the left, an entire scale would be played. The root and type of scale will also be selected by the user through a menu.  So for example, if the user chooses the E minor scale, the notes of the first two rows of the grid would look like this:

E - F# - G - A - B - C - D
D - C - B - A - G - F# - E

The remainder of the document is structured so that 5.2 contains the functional requirements, 5.3, the performance requirements, and 5.4, the environmental requirements.



## 5.2 Functional Requirements ##

> Functional requirements are those that are needed for the application to work as intended.  Mobile Musician will include various features apart from the main square button grid.  Some of these include features that randomize the order of the notes, change the instrument or the type of scale and root, play a metronome, and record a phrase. Some instruments available are the piano, violin, acoustic guitar, and electric guitar.  Some scales featured are the major, natural minor, harmonic minor, blues, major and minor pentatonic, chromatic, and user defined scales. When a recorded phrase is played, it spits back what notes are contained in it.  The recording is a ten second clip, and only one is stored at a time to cut down on memory usage (and since recording is not meant to be a primary function of the program).  The user is also be able to toggle sustain on and off.  The functionally is divided into a Model-View-Controller design.


#### 5.2.1 The Model ####

> The model of the application deals with the structure and states of the modules.  It is mainly how the notes are arranged in the grid, as well as the current scale, root, instrument, any clip that has been recorded, whether or not to sustain the notes, and size of the buttons.

**5.2.1.1** Mobile Musician shall be an iPod and iPhone App.

**5.2.1.2** The notes in the button boxes shall be ordered according to the currently selected scale.

**5.2.1.3** There shall be at least two available instruments.
> The instruments should be piano, acoustic guitar, electric guitar, and/or violin.

#### 5.2.2 The View ####

> The view of the application determines the layout of the Graphical User Interface (GUI).  The main parts of this are the grid of buttons, the record and play buttons, and the menu which controls all of the elements mentioned in the model portion.

**5.2.2.1** Mobile Musician shall have 3 to 4 octaves of button boxes.
> The number of buttons should depend on the scale and the size of the buttons.

**5.2.2.2** Mobile Musician shall have a menu button in the bottom right corner of the iPod.
> This will be called the Menu Button.

**5.2.2.3** There shall be a window containing a menu with various options for customizing Mobile 	Musician.
> This Window will be called the Main Menu.

**5.2.2.4** The Main Menu shall contain a checkbox labeled, Sustain.

**5.2.2.5** The Main Menu shall contain a drop down menu with the 12 notes (A-G#).
> These will be called the Root Menu
> The default will be A.

**5.2.2.6** The Main Menu shall contain another drop down menu with a list of at least 3 scales.
> The scales should include major and minor heptatonics and pentatonics, blues, and the 	chromatic scale.
> The default will be the chromatic scale.

**5.2.2.6** There shall be a button to record a sequence in the bottom left corner.
> This will be called the Record button.

**5.2.2.7** There shall be a button to play a recorded sequence in the bottom left corner.
> This will be called the Play button.

**5.2.2.7** The Main Menu shall contain a create scale button.
> This will be called User Scale button.

**5.2.2.8** The create scale window shall contain the 12 notes A-G# in the button boxes.
> This window will be called the User Scale Window.

**5.2.2.9** The Main Menu shall have a display note checkbox, that, when checked, displays the note 	names on the button boxes.

**5.2.2.10** The Main Menu shall contain a randomizer button to randomize notes in a scale.
> This will be called the Random Order Button.

**5.2.2.11** Mobile Musician shall have a splash screen and play a sound on start up.

**5.2.2.12** The Main Menu shall contain an instrument drop down menu.
> This will be called the Instrument Menu.

**5.2.2.13** The Main Menu shall contain a button to turn the names of the notes on the boxes on and off.

**5.2.2.14** The Main Menu shall contain radio buttons to determine the size of the buttons.
> These will be called the Size Buttons

#### 5.2.3 The Controller ####

> The controller of the application executes code based on input received.  In Mobile Musician, specifically, this means the calculation of a note based on what button is pressed, changing the instrument, scale, root, sustain, or size of the buttons when this is altered in the Main Menu.

**5.2.3.1** Mobile Musician shall play a note based on what button is touched and what instrument is 	selected.

**5.2.3.2** Mobile Musician shall provide visual feedback when a box is touched.
> The visual feedback should be a slight increase in the size of the button when it is being 	touched.

**5.2.3.3** The Menu button shall toggle the Main Menu's visibility.

**5.2.3.4** The User Scale Button shall toggle the User Scale Window's visibility.

**5.2.3.5** The record button shall record up to 10 seconds of sound.

**5.2.3.6** The Play button shall play any recorded sound.

**5.2.3.7** The Play button shall overwrite any previous recording.

**5.2.3.8** The size buttons shall be small, medium, and large.

## 5.3 Performance Requirements ##

This section describes requirements for the performance of a functional implementation of Mobile Musician.

##### 5.3.1 Note Button Response Time #####
**5.3.1.1** A note shall play in less than a half second when touched.

**5.3.2** Load Time
**5.3.2.1** The application shall load in less than 8 seconds.

## 5.4 Environment Requirements ##

Hardware and software required to develop and then deploy Mobile Musician.

#### 5.4.1 Development ####

**5.4.1.1** Xcode with iPhone Simulator.

**5.4.1.2** Apple Developer's License

**5.4.2.3** Mac with Snow Leopard

Xcode is a text editor for creating Apple projects in Objective-C, including iPod, iPhone, and iPad.  The simulator allows for testing the GUI on a virtual machine.

#### 5.4.2 Deployment ####

**5.4.2.1** iPod Touch, iPhone, or iPad

Mobile Apple devices should have iOs 4.0 or higher.  The iPad runs iPod and iPhone apps, but the
graphics will most likely be pixelated or take up only a small portion of the screen.