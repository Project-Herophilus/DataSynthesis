package io.connectedhealth.idaas.datasynthesis.common;

import java.util.Random;

public class Randomization{
    private Random rnd;

    public Randomization() {
        rnd = new Random();
    }

    public Randomization(Random rnd) {
        this.rnd = rnd;
    }

    public String randomLetters(int numLetters) {
        if (numLetters == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numLetters; i++) {
            sb.append((char)(rnd.nextInt(26) + 'A'));
        }
        return sb.toString();
    }

    public String randomDigits(int digits) {
        if (digits == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < digits - 1; i++) {
            sb.append((char)(rnd.nextInt(10) + '0'));
        }
        sb.append((char)(rnd.nextInt(9) + '1'));
        return sb.toString();
    }

    public String randomEntry(String[] entries) {
        return entries[rnd.nextInt(entries.length)];
    }

    // chance% to select one from entries, otherwise return ""
    public String randomEntry(String[] entries, int chance) {
        if (rnd.nextInt(100) > chance) {
            return "";
        }
        return randomEntry(entries);
    }
}