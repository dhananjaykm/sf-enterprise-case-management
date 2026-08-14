public with sharing class AssetCaseService {
    public static void onAssetUpdate(List<Asset> assets) {
        ApplicationLogger.info('AssetCaseService', 'assets ' + assets.size());
    }
}
