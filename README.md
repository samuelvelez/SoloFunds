## README

Instructions:
Please do this when you have ample time to complete the task.  It should not take more than two hours at the most.  Feel free to use resources on the Internet such as Stack Overflow or official iOS Documentation. Try to not rely on third party libraries, we want to see your code. When you are finished, please zip up the project folder and email it back to us. Or put it on a shared document cloud like Google Docs or GitHub and send us the link.
 

Write an app that… 

Displays a First page

Presents a view containing a top navigation bar, a text field and a List of items.
The text field should allow only numeric input (0-9).
When the text field returns (user taps Done on the keyboard), take the number the user entered (We'll call it N).
Calculate each value in the Fibonacci sequence F(n) from 1 to N such that F(0) = 0, F(1) = 1, F(2) = 1, F(3) = 2 and so on.
Display each number-value pair computed in the list, one pair per line.
Each line should display its N on the left, left aligned, and its F(N) on the right, right aligned. i.e.  [ N        F(N) ].
Display the total time to calculate all the numbers in milliseconds at the bottom of the page. This should not be part of the scrolling list.
Provide a button on the right side of the navigation bar and call this Summary, and when you tap on the button it takes you to a second page.
 

Displays a Second page

The Second page will display a summary of all the calculations from the First page. 
It will show a list to display the N and the time it took to do the calculation.
On each line the N will be left justified and the time in milliseconds will be right justified. i.e.  [N ms].
Provide a way to return to the First page in the navigation bar. i.e. a Back button.
The list on the Second page will keep track of ALL calculations from the time the app starts.
 

Note: Pay attention to design a clean app architecture and take advanta