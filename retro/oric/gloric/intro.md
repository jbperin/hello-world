Hi every body

My name is Jean-Baptiste.

I'm a developer on glOric project at Oric Software and I want to inform oric'developers that a very nice function was recently pushed on the gloric repository at Oric Software.

It is what could be called an "Hyper Fast Projection Routine".

This function is of interest for people intending to render 3D scene on Oric in real time context because it computes screen coordinates from 3D coordinates and it does it fast .. terribly fast .. (about 500 cycles per point).

Given the camera situation (position and orientation) and a screen configuration, this function gives screen 2d-coordinates of up to 64 projected 3d points.

CameraPosition = [Xc, Yc, Zc]	// 3D cartesian coordinates of viewer
CameraOrientation = [Rz, Rx]	// Yaw, Pitch (no Roll for now)
ScreenGeometry = [W, H]			// Width  and heigth of display
For all 64 points DO
	Point[L, C] = project3D (X, Y, Y) // Compute Line And Column of points 

the 2d-coordinates thus obtained can either be used to simply display points on screen, draw lines and faces between them, or be used as base coordinates for drawing tiles. It's up to you. 

Unfortunately, even though this function is already available on the glOric repository at Oric Software, there's no program actually using it at the moment. And then, there's no way to experience it in real context.

I'm actively working at releasing a little sample app that uses this "Hyper Fast Projection Routine". And be sure that I long to be able to demonstrates its power.


But for now I can only show a little teaser i had released at an earlier developpement stage of the "hyper fast projection routine". By that time it was just a "fast projection routine" (3 times slower than the "hyper fast").

In this teaser app, i use a home-made ascii art rasterizing routine to display the result of 3D projection on a 2D Text Mode screen.

This teaser app consists in:
- an intro in which the camera position and orientation is animated 
- followed by an interactive phase where you can manually move the camera with the following keyboard commands:

 
    Arrow (up / down) to go ( forward / backward )
    W / X  to shift (left / right)
    Arrow (left / right )  to rotate the camera 
    Q / A    to pitch (up / down)
    P / ;    to go (up / down) 


You have to be warned that:
- It is just a proof of concept stuff. I focused on having the math material working and I haven't spent enough effort on rendering and rasterizing parts.
- It's totally buggy (some catastroph may occur when positionnal or angular extrema are reached)
- It's slow compared to what it could be (this is only the "fast projection routine" i.e 3 times slower than the "hyper fast projection routine")

If, in spite of the low quality of this demo, you perceive to potential of this function an that you're interested in its forthcoming evolution, stay tuned on this thread, i'll post here some news when noticable steps are performed. 

Questions, comments, remarks and constructive criticism are more than welcome.

For those interested in the magic behind this "Hyper Fast Projection Function", here are the 
