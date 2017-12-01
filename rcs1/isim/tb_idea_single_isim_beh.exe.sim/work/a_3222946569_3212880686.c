/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/nfs/TUEIEDA/LabHDL/2017s/ga87dew/submit/rcs1/control.vhd";



static void work_a_3222946569_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t32;
    int t34;
    char *t35;
    char *t37;
    char *t38;

LAB0:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3424);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(95, ng0);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t0 + 5686);
    t10 = xsi_mem_cmp(t7, t8, 4U);
    if (t10 == 1)
        goto LAB9;

LAB19:    t11 = (t0 + 5690);
    t13 = xsi_mem_cmp(t11, t8, 4U);
    if (t13 == 1)
        goto LAB10;

LAB20:    t14 = (t0 + 5694);
    t16 = xsi_mem_cmp(t14, t8, 4U);
    if (t16 == 1)
        goto LAB11;

LAB21:    t17 = (t0 + 5698);
    t19 = xsi_mem_cmp(t17, t8, 4U);
    if (t19 == 1)
        goto LAB12;

LAB22:    t20 = (t0 + 5702);
    t22 = xsi_mem_cmp(t20, t8, 4U);
    if (t22 == 1)
        goto LAB13;

LAB23:    t23 = (t0 + 5706);
    t25 = xsi_mem_cmp(t23, t8, 4U);
    if (t25 == 1)
        goto LAB14;

LAB24:    t26 = (t0 + 5710);
    t28 = xsi_mem_cmp(t26, t8, 4U);
    if (t28 == 1)
        goto LAB15;

LAB25:    t29 = (t0 + 5714);
    t31 = xsi_mem_cmp(t29, t8, 4U);
    if (t31 == 1)
        goto LAB16;

LAB26:    t32 = (t0 + 5718);
    t34 = xsi_mem_cmp(t32, t8, 4U);
    if (t34 == 1)
        goto LAB17;

LAB27:
LAB18:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 5766);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);

LAB33:
LAB8:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t2 = (t0 + 3696);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t3, 4U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB3;

LAB5:    t2 = (t0 + 992U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB7;

LAB9:    xsi_set_current_line(96, ng0);
    t35 = (t0 + 5722);
    t37 = (t0 + 2128U);
    t38 = *((char **)t37);
    t37 = (t38 + 0);
    memcpy(t37, t35, 4U);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 3504);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB10:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 5726);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    goto LAB8;

LAB11:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 5730);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    goto LAB8;

LAB12:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 5734);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    goto LAB8;

LAB13:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 5738);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    goto LAB8;

LAB14:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 5742);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    goto LAB8;

LAB15:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 5746);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    goto LAB8;

LAB16:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 5750);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB17:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 5758);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 4U);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);

LAB30:    goto LAB8;

LAB28:;
LAB29:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 5754);
    t8 = (t0 + 2128U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    memcpy(t8, t2, 4U);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3504);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB30;

LAB32:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 5762);
    t8 = (t0 + 2128U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    memcpy(t8, t2, 4U);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3504);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB33;

}


extern void work_a_3222946569_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3222946569_3212880686_p_0};
	xsi_register_didat("work_a_3222946569_3212880686", "isim/tb_idea_single_isim_beh.exe.sim/work/a_3222946569_3212880686.didat");
	xsi_register_executes(pe);
}
