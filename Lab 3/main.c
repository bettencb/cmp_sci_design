#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

int main() {

	void *virtual_base;
	int fd;
	void *h2p_lw_ctrl_addr, *h2p_lw_timer_addr;
	void *h2p_lw_a_addr, *h2p_lw_b_addr, *h2p_lw_prod_addr, *h2p_lw_sum_addr;
	float *a;	// Arrays for a and b (8 elements each)
	float *b;
    float *p_fpga, *s_fpga;

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
	

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	
	h2p_lw_a_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_A_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_b_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_B_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_prod_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_PROD_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_sum_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_SUM_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_ctrl_addr=virtual_base + ( ( unsigned long )( ALT_LWFPGASLVS_OFST + FPCTRL_PIO_BASE ) & (unsigned long)( HW_REGS_MASK ) );
	h2p_lw_timer_addr=virtual_base + ( ( unsigned long )( ALT_LWFPGASLVS_OFST + CLK_24_BASE ) & (unsigned long)( HW_REGS_MASK ) );
	
	
	p_fpga = (float *) h2p_lw_prod_addr;
	printf("%f\n", *p_fpga);
	
	
	s_fpga = (float *) h2p_lw_sum_addr;
	printf("%f\n", *s_fpga);

	uint32_t *count_fpga; // Count value from FPGA
	double time_fpga;		
	
	clock_t	start;	// CPU time variables using software measurement
	clock_t  stop;
	double   delta_time;
	

	
	int i;
	float ip_cpu = 0.0;  // software inner product
	float a_max = 10.0;
	float b_max = 10.0;
	
	a = (float *) calloc (8, sizeof(float));
	b = (float *) calloc (8, sizeof(float));
	

	// Generate data arrays for a and b_max
	srand(time(0));

    //float a = 5.0;
    for (i=0;i < 8;i++)
	{
        a[i] = ((float) rand()/(float)(RAND_MAX)) * a_max;
		b[i] = ((float)rand()/(float)(RAND_MAX)) * b_max;
		
		*(uint32_t *)h2p_lw_ctrl_addr = 0x00; // Make sure load and shift are off
		
		// Send a and b to FPGA
		*(float *)h2p_lw_a_addr = a[i];
		*(float *)h2p_lw_b_addr = b[i];
		printf("a = %f b = %f \n", a[i], b[i]);
		
		*(uint32_t *)h2p_lw_ctrl_addr = 0x08; // Shift new values in
	}
	
	start = clock();	// Software timing begin

	*(uint32_t *)h2p_lw_ctrl_addr = 0x00; // Reset the FPGA timer
	*(uint32_t *)h2p_lw_ctrl_addr = 0x03; // Enable the FPGA timer
	
	
    for (i=0;i < 8;i++)
	{
        ip_cpu = a[i]*b[i] + ip_cpu;
	}
	
	*(uint32_t *)h2p_lw_ctrl_addr = 0x01; // Stop the timer (but don't reset)
	stop = clock();		// Software timing end

	// Get timer count from FPGA
	count_fpga = (unsigned int *)h2p_lw_timer_addr;
	time_fpga = *count_fpga * 20e-9;
	
	delta_time = ((double) (stop-start))/ CLOCKS_PER_SEC;  // difftime(stop, start);

	
	printf("Time elapsed for CPU MAC = %e  fpga time = %e\n", delta_time, time_fpga);
	//printf("Time elapsed in CPU cycles for multiply = %u \n", delta_u);
	
	
	
	printf("CPU answer = %f\n", ip_cpu);
	
	// Get answer from FPGA
	p_fpga = (float *) h2p_lw_prod_addr;
	printf("FPGA answer %f\n", *p_fpga);
	

	// clean up our memory mapping and exit
	free(a);
	free(b);
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0) {
		printf("ERROR: munmap() failed...\n");
		close( fd );
	}
	
	return( 0 );
}
