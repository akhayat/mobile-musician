# Software Configuration Management Document #

## 7.0 Introduction ##

This Software Configuration Management Document describes the Configuration Management of the Mobile Musician Application, or the process of identifying, controlling, reporting, and auditing of the configuration of this project.  Anthony Khayat will perform all configuration management for Mobile Musician.

## 7.1 SwCM Activities ##

This section identifies the configuration management of each of the CSCIs (Computer Software Configuration Item) of Mobile Musician.  Each CSCI is
listed in SDD 6.3.

The Configuration Management process that will be used in this project involves frequent commits.  Code is to be committed whenever a minor task is completed in such a way that it introduced no new known bugs.

### 7.1.1 Configuration Identification ###

### 7.1.2 Configuration Control ###

The main tool for configuration control is SVN (Subversion) via Google Code. Code for Mobile Musician will be committed to the repository in the project site.  SVN allows committing via the command line, and there is also SVN built into Xcode.  Other commands, such as deleting files in the repository, checking out code from the repository, and reverting to an older version stored in the repository are available.

#### 7.1.2.1 Document and Software Release ####

#### 7.1.2.2 Non-Deliverable Software ####

## 7.2 SwCM Schedules ##

**ALPHA Release**  The alpha version of Mobile Musician is set to be released 3/29/2011

**BETA Release**  The beta version of Mobile Musician is set to be released  4/12/2011

**Final Release**  The first complete version is set to be released 05/06/2011

## 7.3 SwCM Software/Hardware Resources ##

These are the software and hardware resources necessary to configure Mobile Musician.

#### 7.3.1 SVN ####

As mentioned earlier SVN is to the software configuration tool to be used to commit code to the online repository for Mobile Musician.  This should be done either on the command line or (preferably) through Xcode.

#### 7.3.2 iPod Touch / iPhone ####

For the ALPHA, BETA, and final versions of Mobile Musician, the user should be able to access them through an iPod rather than through a simulator.