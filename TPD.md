# Test Plan Document #

## 8.1 Introduction ##

This document outlines the plans for how Mobile Musician will be tested.  It includes unit testing, integration testing, and acceptance testing.  Some tests will be run through manual procedures but some will be automated through assert statements in test files.  There will be one main test file that will run all the individual automated tests.

## 8.2 Unit Test Plan ##

The unit tests in Mobile Musician test modules individually to ensure functionality when standing alone.  This includes testing each module in the model and each view.

### 8.2.1 Unit Tests Planned ###

#### 8.2.1.1 Note ####

Blackbox testing to verify that note objects are created and changed properly.  Also test that bad values are rejected.

#### 8.2.1.2 Scale ####

Blackbox testing to verify that scales are properly created, and that they return notes correctly with the given root.

#### 8.2.1.3 SoundPlayer ####

Blackbox testing to verify that the class correctly changes the pitch of a given note.

#### 8.2.1.4 NoteView ####

Whitebox testing to verify that the correct number of boxes appears and the in the right places with the correct names.

#### 8.2.1.5 MenuView ####

White box testing to verify that the the correct buttons appear in the Menu View.

#### 8.2.1.6 ChangeScaleView ####

White box testing to verify that the correct scale buttons appear in the correct places.

#### 8.2.1.7 CreateScaleView ####

White box testing to verify that the correct interval buttons appear int he correct places (and the cancel button).

### 8.2.2 Unit Test Procedures ###

#### 8.2.2.1 Note Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Check the console for Note Test failures.

#### 8.2.2.2 Scale Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Check the console for Scale Test failures.

#### 8.2.2.3 SoundPlayer Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Check the console for SoundPlayer Test failures.

#### 8.2.2.4 NoteView Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Verify that there are 48 evenly spaced buttons.
  1. Verify that there the names of the notes appear in the correct order according to the scale.
  1. Ensure that there is a menu button in the bottom of the screen.
  1. Ensure that there is a record button in the bottom left.

#### 8.2.2.5 MenuView Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Touch the Menu button.
  1. A new Menu Window should appear.
  1. Verify that there are change scale, change root, and display note names buttons appear.

#### 8.2.2.6 ChangeScaleView Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Touch the Menu Button.
  1. Touch the Change Scale Button.
  1. A new Change Scale Window should appear
  1. Verify that the Predefined Scales and Create New Buttons appear.

#### 8.2.2.7 CreateScaleView Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Touch the Menu Button.
  1. Touch the Change Scale Button.
  1. Touch the Create Scale Button.
  1. A New Scale Window should appear.
  1. Verify that there are twelve Interval Buttons and a Cancel Button.

## 8.3 Integration Test Plan ##

Integration tests are meant to test how multiple modules interact.  This is mostly seen in the view controllers.

### 8.3.1 Integration Tests Planned ###

#### 8.3.1.1 Sound ####

Whitebox test to ensure that Notes play sounds.

#### 8.3.1.2 Change Scale ####

Whitebox test to ensure that the arrangement of notes change when a scale is changed.

#### 8.3.1.3 Note Name Toggle ####

Whitebox test to ensure notenames are toggled on and off when the button is pressed in the Menu.

#### 8.3.1.4 Record ####

Whitebox test to ensure a sequence is recorded and able to play back when the button is pressed.

#### 8.3.1.5 Create Scale ####

Whitebox test to ensure that the arrangement of notes changes when the button is pressed.

#### 8.3.1.6 Pitch ####

Whitebox test to ensure that Note Buttons have the correct pitches.

### 8.3.2 Integration Test Procedures ###

#### 8.3.2.1 Sound Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Press a Note Button.
  1. It should emit a sound.
  1. Press a different Note Button.
  1. It should emit a difference sound.

#### 8.3.2.2 Change Scale Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Touch the Menu Button.
  1. Touch the Change Scale Button.
  1. Touch a scale.
  1. The Change Scale Menu should quit automatically after this.
  1. Touch the cancel button
  1. The Note Buttons should automatically have readjusted according to the new scale.

#### 8.3.2.3 Note Name Toggle Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Touch the Toggle Names Button.
  1. Touch the Close Menu Button.
  1. The Note names should be off.
  1. Touch the Menu Button.
  1. Touch The Toggle Names Button.
  1. Touch the Close Menu Button.
  1. The Note Names should be displayed again.

#### 8.2.3.4 Record Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Press Record.
  1. Play some notes until it stops recording.
  1. Verify that a Play Button has not appeared next to Record.
  1. Press Play.
  1. Verify that the same notes played are played back.
  1. Repeat steps 2 and 3.
  1. Press Play.
  1. The first notes should have been overwritten.

#### 8.3.2.5 Create Scale Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Touch the Menu Button.
  1. Touch the Change Scale Button.
  1. Touch the Create Scale Button.
  1. Choose a root note.
  1. Press the Interval buttons you wish to create the steps necessary for your scale.
  1. Press Done.
  1. You should be returned to the Note View.
  1. Verify that the notes are arranged with the chosen root and the created scale.

#### 8.3.2.5.6 Pitch Test Procedure ####

  1. Run the Mobile Musician Application.
  1. Touch a Note Button.
  1. Check the console to ensure the proper pitch is displayed.

## 8.4 Acceptance Test Plan ##

The acceptance test tests that the entire program is running according to the requirements.

### 8.4.1 Acceptance Test Planned ###

#### 8.4.1.1 Mobile Musician Test ####

Tests full and complete functionality of Mobile Musician.

### 8.4.2 Acceptance Test Procedures ###

  1. Run the Mobile Musician Application.
  1. Look in the console.  It should say that all assertions passed.
  1. Verify that the notes are arranged in the default order with note names on.
  1. Retest All items from the integration test.
  1. Press the Menu Button.
  1. The Menu Windows should appear.
  1. Press the Change Root button.
  1. Press the Close Button. The Menu Windows should close.
  1. The Root should have adjusted to the new selection.
  1. Close Mobile Musician.

## 8.5 Test Configuration Control ##

A majority of the testing is done graphically, so configuration control is unnecessary for those.  However, some tests are made in test files using assertions.  These tests will be committed along with the project in a directory called test.

## 8.6 Items Not Tested ##

Every item in Mobile Musician is currently being (or planned on being) tested.

## 8.7 Test Verification Matrix ##

This item should appear in [Downloads](http://code.google.com/p/mobile-musician/downloads/list)