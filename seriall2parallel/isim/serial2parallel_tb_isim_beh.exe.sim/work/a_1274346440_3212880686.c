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
static const char *ng0 = "/home/torben/sync/FHDW/BES2-U2/vhdl/Projekte/seriall2parallel2/serial2parallel.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_1434214030532789707_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1274346440_3212880686_p_0(char *t0)
{
    char t18[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    int t17;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3424);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 5856);
    t4 = (t0 + 2128U);
    t7 = *((char **)t4);
    t4 = (t7 + 0);
    memcpy(t4, t1, 8U);
    t8 = (t0 + 2072U);
    xsi_variable_act(t8);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 5864);
    t4 = (t0 + 3568);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast(t4);

LAB9:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 5831);
    t8 = (t0 + 2128U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    memcpy(t8, t3, 8U);
    t10 = (t0 + 2072U);
    xsi_variable_act(t10);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 5839);
    t4 = (t0 + 3504);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 5847);
    t4 = (t0 + 3568);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast(t4);
    goto LAB6;

LAB8:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2128U);
    t4 = *((char **)t1);
    t11 = (7 - 6);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t1 = (t4 + t13);
    t7 = xsi_get_transient_memory(7U);
    memcpy(t7, t1, 7U);
    t8 = (t0 + 2128U);
    t9 = *((char **)t8);
    t14 = (7 - 7);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t8 = (t9 + t16);
    memcpy(t8, t7, 7U);
    t10 = (t0 + 2072U);
    xsi_variable_act(t10);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 2128U);
    t4 = *((char **)t1);
    t17 = (0 - 7);
    t11 = (t17 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t1 = (t4 + t13);
    *((unsigned char *)t1) = t2;
    t7 = (t0 + 2072U);
    xsi_variable_act(t7);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 5776U);
    t4 = (t0 + 5850);
    t8 = (t18 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 2;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t17 = (2 - 0);
    t11 = (t17 * 1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t2 = ieee_p_1242562249_sub_1434214030532789707_1035706684(IEEE_P_1242562249, t3, t1, t4, t18);
    if (t2 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 5776U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t18, t3, t1, 1);
    t7 = (t18 + 12U);
    t11 = *((unsigned int *)t7);
    t12 = (1U * t11);
    t2 = (3U != t12);
    if (t2 == 1)
        goto LAB14;

LAB15:    t8 = (t0 + 3568);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t4, 3U);
    xsi_driver_first_trans_fast(t8);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(53, ng0);
    t9 = (t0 + 2128U);
    t10 = *((char **)t9);
    t9 = (t0 + 3504);
    t19 = (t9 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t10, 8U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 5853);
    t4 = (t0 + 3568);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast(t4);
    goto LAB12;

LAB14:    xsi_size_not_matching(3U, t12, 0);
    goto LAB15;

}


extern void work_a_1274346440_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1274346440_3212880686_p_0};
	xsi_register_didat("work_a_1274346440_3212880686", "isim/serial2parallel_tb_isim_beh.exe.sim/work/a_1274346440_3212880686.didat");
	xsi_register_executes(pe);
}
