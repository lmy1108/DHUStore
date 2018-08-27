package com.dhu.demo2.Utils;
import java.util.Properties;
//import com.dhu.demo2.Utils.DESCoder;
//import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanInitializationException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * 配置文件解密核心类
 * 作为自定义类加到配置文件中，解密使用
 * @author Administrator
 *
 */
public class EncryptablePropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties props)
            throws BeansException {
        try {
            // DesEncrypt des = new DesEncrypt();
            String username = props.getProperty(MyWebConstant.JDBC_DATASOURCE_USERNAME_KEY);
            if (username != null) {
                props.setProperty(MyWebConstant.JDBC_DATASOURCE_USERNAME_KEY, DesEncrypt.decrypt(username,DesEncrypt.PASSWORD_CRYPT_KEY));
                System.out.println(props.getProperty(MyWebConstant.JDBC_DATASOURCE_USERNAME_KEY));
            }

            String password = props.getProperty(MyWebConstant.JDBC_DATASOURCE_PASSWORD_KEY);
            if (password != null) {
                props.setProperty(MyWebConstant.JDBC_DATASOURCE_PASSWORD_KEY,DesEncrypt.decrypt(password,DesEncrypt.PASSWORD_CRYPT_KEY));
                System.out.println(props.getProperty(MyWebConstant.JDBC_DATASOURCE_PASSWORD_KEY));
            }
            String url = props.getProperty(MyWebConstant.JDBC_DATASOURCE_URL_KEY);
            if (url != null) {
                props.setProperty(MyWebConstant.JDBC_DATASOURCE_URL_KEY,
                        url);
            }

            String driverClassName = props.getProperty(MyWebConstant.JDBC_DATASOURCE_DRIVERCLASSNAME_KEY);
            if (driverClassName != null) {
                props.setProperty(MyWebConstant.JDBC_DATASOURCE_DRIVERCLASSNAME_KEY,
                       driverClassName);
            }
            super.processProperties(beanFactory, props);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BeanInitializationException(e.getMessage());
        }
    }
}