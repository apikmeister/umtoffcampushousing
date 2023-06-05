package com.group1.offcampushousing.umtoffcampushousing.utils;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

public class RateLimitedUtils {

    private static final int MAX_REQUESTS = 10; // Maximum number of requests allowed within the time window
    private static final long TIME_WINDOW = 1; // Time window in seconds
    private static final Map<String, Long> requestCounts = new ConcurrentHashMap<>();
    private static final Map<String, Long> requestTimestamps = new ConcurrentHashMap<>();

    public static boolean isRateLimited(String ipAddress) {
        long currentTime = System.currentTimeMillis() / 1000; // Convert to seconds

        // Clean up expired entries
        requestCounts.entrySet().removeIf(entry -> currentTime - entry.getValue() >= TIME_WINDOW);

        // Check if the IP address has exceeded the maximum requests within the time window
        if (requestCounts.getOrDefault(ipAddress, 0L) >= MAX_REQUESTS) {
            return true;
        }

        // Update request count and timestamp
        requestCounts.put(ipAddress, requestCounts.getOrDefault(ipAddress, 0L) + 1);
        requestTimestamps.put(ipAddress, currentTime);

        return false;
    }

}
