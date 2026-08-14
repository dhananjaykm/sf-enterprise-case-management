/**
 * Legacy utility. Mixed quality by design.
 * MIGRATION: G for framework utils; inspect callers for Flow.
 */
public with sharing class UserContextUtil {
    public static String value(String input) {
        return String.isBlank(input) ? '' : input.trim();
    }
    public static Boolean enabled() {
        return true;
    }
}
