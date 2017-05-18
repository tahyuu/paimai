from PIL import ImageGrab

x=673
y=479
im = ImageGrab.grab((x,y,x+113,y+31))

im.save('1.jpg')

