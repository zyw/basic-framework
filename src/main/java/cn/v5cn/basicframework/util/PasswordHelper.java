package cn.v5cn.basicframework.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * Created by ZYW on 2014/10/27.
 */
@Service
public class PasswordHelper {

    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    @Value("${password.algorithmName}")
    private String algorithmName="md5";
    @Value("${password.hashIterations}")
    private int hashIterations=2;

    public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
        this.randomNumberGenerator = randomNumberGenerator;
    }

    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }

    public TupleTwo<String,String> encrypt(String original,String mix){
        String salt = randomNumberGenerator.nextBytes().toHex();
        String pwd = new SimpleHash(algorithmName,
                original,
                ByteSource.Util.bytes(getCredentialsSalt(mix,salt)),
                hashIterations).toHex();
        return new TupleTwo<String,String>(salt,pwd);
    }
    /**
     * 字符串混淆
     * */
    public static String getCredentialsSalt(String mix1,String mix2) {
        return mix1 + mix2;
    }

//    public static void main(String[] args) {
//        PasswordHelper passwordHelper = new PasswordHelper();
//        TupleTwo<String, String> zhangsan = passwordHelper.encrypt("000000", "zhangsan");
//        System.out.println(zhangsan.a);
//        System.out.println(zhangsan.b);
//    }
}
