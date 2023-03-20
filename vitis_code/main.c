/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "rete_mnist_ip.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "string.h"
#include "images.h"


u32 fromBinary(const char* const str) {
	return (u32) strtoul(str, NULL, 2);
}

int getPrediction(u32* reg1, int k) {
	u32* reg = reg1;

	u16 pred[10];

	// PARSING (default 8 bit, altrimenti specificato)s
	pred[0] = (*reg & (0x1ff << 15)) >> 15; // 9 bit
	pred[0] = ((u16) (((s16) ((u16)pred[0] << 7)) >> 7));

	pred[1] = (*reg & (0x1ff << 6)) >> 6; // 9 bit
	pred[1] = ((u16) (((s16) ((u16)pred[1] << 7)) >> 7));

	pred[2] = ( ((*reg & 0x3F) << 4) | ((*(reg + 1) & (0x7 << 29)) >> 29) ); // 9 bit
	pred[2] = ((u16) (((s16) ((u16)pred[2] << 7)) >> 7));

	pred[3] = (*(reg + 1) & (0x1ff << 20)) >> 20; // 9 bit
	pred[3] = ((u16) (((s16) ((u16)pred[3] << 7)) >> 7));

	pred[4] = (*(reg + 1) & (0xff << 12)) >> 12;
	pred[4] = ((u16) (((s16) ((u16)pred[4] << 8)) >> 8));


	pred[5] = (*(reg + 1) & (0x1ff << 3)) >> 3; // 9 bit
	pred[5] = ((u16) (((s16) ((u16)pred[5] << 7)) >> 7));

	pred[6] = ( (*(reg + 1) & 0x7) << 5 ) | ((*(reg + 2) & (0x1f << 27)) >> 27);
	pred[6] = ((u16) (((s16) ((u16)pred[6] << 8)) >> 8));

	pred[7] = (*(reg + 2) & (0x1ff << 18)) >> 18; // 9 bit
	pred[7] = ((u16) (((s16) ((u16)pred[7] << 7)) >> 7));

	pred[8] = (*(reg + 2) & (0x1ff << 9)) >> 9; // 9 bit
	pred[8] = ((u16) (((s16) ((u16)pred[8] << 7)) >> 7));

	pred[9] = (*(reg + 2) & (0x1ff));
	pred[9] = ((u16) (((s16) ((u16)pred[9] << 7)) >> 7));

	/*
	printf("pred[0]: %d\n", (s16)pred[0]);
	printf("pred[1]: %d\n", (s16)pred[1]);
	printf("pred[2]: %d\n", (s16)pred[2]);
	printf("pred[3]: %d\n", (s16)pred[3]);
	printf("pred[4]: %d\n", (s16)pred[4]);
	printf("pred[5]: %d\n", (s16)pred[5]);
	printf("pred[6]: %d\n", (s16)pred[6]);
	printf("pred[7]: %d\n", (s16)pred[7]);
	printf("pred[8]: %d\n", (s16)pred[8]);
	printf("pred[0]0: %d\n", (s16)pred[9]);
	*/

	// Massimo
	s16 max = pred[0];
	u8 max_index = 0;

	for(u8 i = 1; i < 10; i++) {
		if((s16)pred[i] > max) {
			max = pred[i];
			max_index = i;
		}
	}

	return max_index;
}


int main()
{
	init_platform();
	printf("Avvio\n");

	XTime start, end;
	double total_time;

    u32* p_lite_reg0 = (u32*) (XPAR_RETE_MNIST_IP_0_S_MNIST_LITE_AXI_BASEADDR + RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG0_OFFSET);
    u32* p_lite_reg1 = (u32*) (XPAR_RETE_MNIST_IP_0_S_MNIST_LITE_AXI_BASEADDR + RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG1_OFFSET);
    u32* p_lite_reg2 = (u32*) (XPAR_RETE_MNIST_IP_0_S_MNIST_LITE_AXI_BASEADDR + RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG2_OFFSET);
    u32* p_lite_reg3 = (u32*) (XPAR_RETE_MNIST_IP_0_S_MNIST_LITE_AXI_BASEADDR + RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG3_OFFSET);
    u32* p_input_reg_base = (u32*) XPAR_RETE_MNIST_IP_0_S_MNIST_FULL_AXI_BASEADDR;


    // Scrittura input nei registri
    u32* p_base;
    u16 count = 0;
    char* img;

    XTime_GetTime(&start);
    for(int k = 0; k < NUM_IMAGES; k++) {
		 p_base = p_input_reg_base;
		 img = images[k];

		for(int i = 0; i < strlen(img) / 32; i++) {

			char input[33];
			strncpy(input, img + i * 32, 32);
			input[32] = '\0';
			u32 val = fromBinary(input);
			Xil_Out32(p_base++, val);
		}

		while((Xil_In32(p_lite_reg0) & (u32) 1) == 0) {
			printf("Basso\n");
		}

		if(getPrediction(p_lite_reg1, k) == labels[k]) count++;
    }
    XTime_GetTime(&end);
    total_time = 1.0 * (end - start) / XPAR_PS7_CORTEXA9_0_CPU_CLK_FREQ_HZ;

    printf("Accuracy: %f%\n",  (float)count / NUM_IMAGES * 100);
    printf("Total time(s): %lf\n", total_time);

    cleanup_platform();
    return 0;
}
