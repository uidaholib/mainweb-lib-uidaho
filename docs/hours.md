# Library Hours 

The current "Main Library" hours are added to the topbar of every page fetched from LibCal.

The Hours page (/about/hours.html) displays the full current hours for all locations fetched from LibCal.
The standard hours for service points are listed below, statically generated from "_data/about_hours.yml".

## LibCal Hours

The live hours are managed in LibCal.
Changes made in LibCal will go live immediately and display on the website.
LibCal hours are also pulled into the Library card in MyUI.

Since the LibCal hours are used as data pulled into other contexts, it is important to keep them consistent in format and up to date.
Notes: 

- If manually adding hours range, it should match the pattern `7:00am – 12:00am` (a space long dash space), since this is how the system displays the auto generated hours.
- Follow the pattern ` or by appointment (example@uidaho.edu)` or `By appointment (example@uidaho.edu)` for consistency.
- Avoid adding text (other than "by appointment").

The "Main Library" hours are fetched to add to the top of ever page on the website, so are important to keep consistent.
In the data, the json has a status of "open", "24hours", "closed", or "text" (just like the Exceptions you can add) which changes the display.
Notes:

- If the status is "open" or "24hours" it will add `Open ` in front of the rendered hours value (e.g. so you get `Open 6am - 8pm`).
- If the status is "closed" the rendered hours value is `Closed`.
- If using "Closed" with a "Note / message" field, the display adds `Closed` before the message text, so you might want to put a separator in front of the message like `- Due to Power Outage` to get it to look like `Closed - Due to Power Outage` (or alternatively use the custom text option).
- Using the "Custom text" option will display the exact text in the field, in the Hours location at the top of the page. This allows you to provide an emergency message to users, however keep it VERY short to fit in the small space!

## Website set up

The topbar of the default page layout has a span element with id `timedisp` saying "Hours".
The JS is in "_includes/js/current-hours-js.html".
It hits the libcal hours api, gets a json response, parses it to find the correct opening hours (Main Library), and puts it on the page. 
If there is an error, the display will stay as a link to the main hours page.

If the "status" set in LibCal Hours is "open" or "24hours", the javascript will use the "rendered" value from the json and add it to the page with `Open ` in front (e.g. resulting in "Open 9am - 10pm" or "Open 24 Hours"). 
Otherwise, it will just directly use the "rendered" value. 
For "closed" status, this will be "Closed". 
For "text" status, this will be the message.
If you add a note/message in LibCal Hours, the message will be added directly to the "rendered"--so for display purposes, start your message with a dash or other deliminator (e.g. message = `- Due to Power Outage`, will have rendered "Closed - Due to Power Outage").

On the main hours page (/about/hours.html), the top loads the hours using a LibCal embed. 

The standard hours are written out below from "_data/about_hours.yml".
