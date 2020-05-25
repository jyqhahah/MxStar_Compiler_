package riscv.operand;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Set;

public class RegisterList {
    public static RvPhyReg zero = new RvPhyReg("zero");
    public static RvPhyReg ra = new RvPhyReg("ra");
    public static RvPhyReg sp = new RvPhyReg("sp");
    public static RvPhyReg gp = new RvPhyReg("gp");
    public static RvPhyReg tp = new RvPhyReg("tp");
    public static RvPhyReg t0 = new RvPhyReg("t0");
    public static RvPhyReg t1 = new RvPhyReg("t1");
    public static RvPhyReg t2 = new RvPhyReg("t2");
    public static RvPhyReg s0 = new RvPhyReg("s0");
    public static RvPhyReg s1 = new RvPhyReg("s1");
    public static RvPhyReg a0 = new RvPhyReg("a0");
    public static RvPhyReg a1 = new RvPhyReg("a1");
    public static RvPhyReg a2 = new RvPhyReg("a2");
    public static RvPhyReg a3 = new RvPhyReg("a3");
    public static RvPhyReg a4 = new RvPhyReg("a4");
    public static RvPhyReg a5 = new RvPhyReg("a5");
    public static RvPhyReg a6 = new RvPhyReg("a6");
    public static RvPhyReg a7 = new RvPhyReg("a7");
    public static RvPhyReg s2 = new RvPhyReg("s2");
    public static RvPhyReg s3 = new RvPhyReg("s3");
    public static RvPhyReg s4 = new RvPhyReg("s4");
    public static RvPhyReg s5 = new RvPhyReg("s5");
    public static RvPhyReg s6 = new RvPhyReg("s6");
    public static RvPhyReg s7 = new RvPhyReg("s7");
    public static RvPhyReg s8 = new RvPhyReg("s8");
    public static RvPhyReg s9 = new RvPhyReg("s9");
    public static RvPhyReg s10 = new RvPhyReg("s10");
    public static RvPhyReg s11 = new RvPhyReg("s11");
    public static RvPhyReg t3 = new RvPhyReg("t3");
    public static RvPhyReg t4 = new RvPhyReg("t4");
    public static RvPhyReg t5 = new RvPhyReg("t5");
    public static RvPhyReg t6 = new RvPhyReg("t6");
    public static RvPhyReg hi = new RvPhyReg("%hi");
    public static RvPhyReg lo = new RvPhyReg("%lo");

    public static String[] names = {"zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6" };
    public static RvPhyReg[] register = {zero, ra, sp, gp, tp, t0, t1, t2, s0, s1, a0, a1, a2, a3, a4, a5, a6, a7, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, t3, t4, t5, t6};
    public static String[] calleeSavedNames = {"s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11"};
    public static RvPhyReg[] calleeSavedRegister = {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11};
    public static String[] callerSavedNames = {"ra", "t0", "t1", "t2", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "t3", "t4", "t5", "t6"};
    public static RvPhyReg[] callerSavedRegister = {ra, t0, t1, t2, a0, a1, a2, a3, a4, a5, a6, a7, t3, t4, t5, t6};
    public static String[] argumentNames = {"a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7"};
    public static RvPhyReg[] argumentRegister = {a0, a1, a2, a3, a4, a5, a6, a7};
    public static String[] allocableNames = {"ra", "t0", "t1", "t2", "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6" };
    public static RvPhyReg[] allocableRegister = {ra, t0, t1, t2, s0, s1, a0, a1, a2, a3, a4, a5, a6, a7, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, t3, t4, t5, t6};
    public static int allocableNumber = 28;
    public static Set<RvPhyReg> allocableSet = Set.of(ra, t0, t1, t2, s0, s1, a0, a1, a2, a3, a4, a5, a6, a7, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, t3, t4, t5, t6);
    public static Set<RvPhyReg> calleeSavedSet = Set.of(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);

    public static LinkedHashMap<String, RvPhyReg> map;

    public RegisterList() {
        map = new LinkedHashMap<String, RvPhyReg>();
        map.put("zero", zero);
        map.put("ra", ra);
        map.put("sp", sp);
        map.put("gp", gp);
        map.put("tp", tp);
        map.put("t0", t0);
        map.put("t1", t1);
        map.put("t2", t2);
        map.put("s0", s0);
        map.put("s1", s1);
        map.put("a0", a0);
        map.put("a1", a1);
        map.put("a2", a2);
        map.put("a3", a3);
        map.put("a4", a4);
        map.put("a5", a5);
        map.put("a6", a6);
        map.put("a7", a7);
        map.put("s2", s2);
        map.put("s3", s3);
        map.put("s4", s4);
        map.put("s5", s5);
        map.put("s6", s6);
        map.put("s7", s7);
        map.put("s8", s8);
        map.put("s9", s9);
        map.put("s10", s10);
        map.put("s11", s11);
        map.put("t3", t3);
        map.put("t4", t4);
        map.put("t5", t5);
        map.put("t6", t6);
    }

    public RvPhyReg getRegister(String Identifier) {
        return map.get(Identifier);
    }


}
