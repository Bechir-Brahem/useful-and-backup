to check that the printer is connected use `lsusb`  
to find the printer's USB URI use `lpinfo -v`   
`usb://Canon/MP280%20series?serial=E6E7CC&interface=1` in my case
you can install ppd files and cups with 
```
yay -S cups cups-pdf foomatic-db foomatic-db-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds  foomatic-db-engine gutenprint foomatic-db-gutenprint-ppds
systemctl enable cups.service
```
to find the printer's ppd file use `lpinfo -m` and search for the specific printer
`lpinfo -m | grep 'PIXMA MP280'` in my case  
then to create a queue use 
```
lpadmin -p <printername> -E -v <usb URI> -m <printer model>
lpadmin -p printerMP280 -E -v "usb://Canon/MP280%20series?serial=E6E7CC&interface=1" -m gutenprint/5.3/Global/stp-bjc-MULTIPASS-MP280.5.3.sim.ppd.gz
```

you can manage printer and jobs with cups's server:
`http://localhost:631/`

then print a test page with 
```
lpr /usr/share/cups/data/default-testpage.pdf -P printerMP280
```


if you run in a problem delete and reuse lpadmin command
