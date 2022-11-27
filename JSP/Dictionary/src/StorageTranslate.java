import java.util.HashMap;

public class StorageTranslate {
    private static HashMap<String, String> storageDictionary;
    public StorageTranslate(){
        storageDictionary = new HashMap<>();
        storageDictionary.put("hello","xin chao");
        storageDictionary.put("car", "xe o to");
        storageDictionary.put("bike", "xe gan may");
        storageDictionary.put("human", "con nguoi");
    }
    public static void addDictionary(String key, String value){
        storageDictionary.put(key, value);
    }
    public static HashMap<String, String> getDictionary(){
        return storageDictionary;
    }
}
