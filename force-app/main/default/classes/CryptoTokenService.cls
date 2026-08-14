/**
 * MIGRATION: G — specialized cryptography. Do not convert.
 */
public with sharing class CryptoTokenService {
    public static String hmac(String payload) {
        Blob mac = Crypto.generateMac('hmacSHA256', Blob.valueOf(payload), Blob.valueOf('legacy-support-secret'));
        return EncodingUtil.base64Encode(mac);
    }
}
