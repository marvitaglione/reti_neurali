
#ifndef RETE_MNIST_IP_H
#define RETE_MNIST_IP_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG0_OFFSET 0
#define RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG1_OFFSET 4
#define RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG2_OFFSET 8
#define RETE_MNIST_IP_S_mnist_lite_AXI_SLV_REG3_OFFSET 12


/**************************** Type Definitions *****************************/
/**
 *
 * Write/Read 32 bit value to/from RETE_MNIST_IP user logic memory (BRAM).
 *
 * @param   Address is the memory address of the RETE_MNIST_IP device.
 * @param   Data is the value written to user logic memory.
 *
 * @return  The data from the user logic memory.
 *
 * @note
 * C-style signature:
 * 	void RETE_MNIST_IP_mWriteMemory(u32 Address, u32 Data)
 * 	u32 RETE_MNIST_IP_mReadMemory(u32 Address)
 *
 */
#define RETE_MNIST_IP_mWriteMemory(Address, Data) \
    Xil_Out32(Address, (u32)(Data))
#define RETE_MNIST_IP_mReadMemory(Address) \
    Xil_In32(Address)

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the RETE_MNIST_IPinstance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus RETE_MNIST_IP_Mem_SelfTest(void * baseaddr_p);

/**
 *
 * Write a value to a RETE_MNIST_IP register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the RETE_MNIST_IPdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void RETE_MNIST_IP_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define RETE_MNIST_IP_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a RETE_MNIST_IP register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the RETE_MNIST_IP device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 RETE_MNIST_IP_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define RETE_MNIST_IP_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the RETE_MNIST_IP instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus RETE_MNIST_IP_Reg_SelfTest(void * baseaddr_p);

#endif // RETE_MNIST_IP_H
