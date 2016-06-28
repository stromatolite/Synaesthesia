Synaesthesia
================

A color detection tool triggering and controlling music and audio.

Description
--------

This tool is about color detection and object tracking. 
Through the camera, the user can filter any color but the one he wants to detect. The tool then triggers events related to the presencei, the color, or the position on the screen. The user can setup predominance threshold of the color. If the threshold is passed it triggers an event.
When the color is detected it can send an message using the OSC or MIDI protocol.
It also uses blob detection on the filtered camera image to track several objects at the same time.
The simplest application example can be a color detection triggering audio (like the Synaesthesia App we released in the App Store and Google Play for Music Tech Fest London).
More complex examples include multi-tracking of objects controlling sound Fx.
In the example app, colors can be calibrated manually and adapted to the object and context.
Once set, the values can be used in the final app.
Synaesthesia is made to be cross-plaform using the OpenCV library, with a first release on iOS and MacOSX.

This project is an experiment to create easy to use open tools.
We provide a dedicated GUI, allowing non-coders to just plug this detection tool to their MIDI device and use any object to control their music software, generating notes or controlling effects. It allows different levels of user expertise.
Users with coding experience can adapt it in their project to do more advanced interaction or even contribute to the tool. 


MusicBricks
--------

This project has been developped thanks to the [http://musicbricks.net/](MusicBricks) project.
#MusicBricks is a collaboration between Stromatolite, Sigma-Orionis, Ircam-Centre Pompidou, Music Technology Group, Vienna University of Technology, and Fraunhofer IDMT.
#MusicBricks has received funding from the European Union’s Horizon 2020 research and innovation programme.

Get involved
--------

Please ask questions, report issues and contribute.
Our github site: 
[https://github.com/stromatolite/Synaesthesia] Github


