import curses

def myApp(stdscr):
    k = 0
    cursor_x = 0
    cursor_y = 0
    
    begin_x = 0; begin_y = 0
    height = 26; width = 40
    win = curses.newwin(height, width, begin_y, begin_x)

    win.clear()
    win.refresh()
    height, width = win.getmaxyx()

    
    # Loop where k is the last character pressed
    while (k != ord('q')):
        
        win.addstr(0, 0, str(k), curses.color_pair(1))
        
        if k == curses.KEY_DOWN:
            cursor_y = cursor_y + 1
            win.addstr(0, 0, "DOWN", curses.color_pair(1))
        elif k == curses.KEY_UP:
            cursor_y = cursor_y - 1
        elif k == curses.KEY_RIGHT:
            cursor_x = cursor_x + 1
        elif k == curses.KEY_LEFT:
            cursor_x = cursor_x - 1

        cursor_x = max(0, cursor_x)
        cursor_x = min(width-1, cursor_x)

        cursor_y = max(0, cursor_y)
        cursor_y = min(height-1, cursor_y)

        #whstr = "Width: {}, Height: {}".format(width, height)
        #win.addstr(0, 0, whstr, curses.color_pair(1))

        win.move(cursor_y, cursor_x)
        
        # Refresh the screen
        win.refresh()
        
        # Wait for next input
        k = win.getch()


    # pad = curses.newpad(40, 26)
    # for y in range(0, 39):
    #     for x in range(0, 25):
    #         pad.addch(y,x, ord('a') + (x*x+y*y) % 26)
    # stdscr.refresh()

def main():
    curses.wrapper(myApp)

if __name__ == "__main__":
    main()
    
    