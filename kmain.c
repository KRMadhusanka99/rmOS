/* The C function */
 #include "frame_buffer.h"
 #include "serial_port.h"

    int kmain()
    {
    	char buff[]="WE ARE THE CODERS";
    	fb_write(buff,sizeof(buff));
    	
	serial_configure(SERIAL_COM1_BASE, Baud_115200);
	serial_write(SERIAL_COM1_BASE, buff, sizeof(buff));
       return 0;
    }
