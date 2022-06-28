package com.ice.client.config;

import com.ice.core.client.IceNioClient;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.Resource;

@SpringBootApplication
public class IceNioClientApplication implements CommandLineRunner {


    @Resource
    private IceClientProperties properties;

    @Resource
    private IceSpringBeanFactory iceSpringBeanFactory;

    @Override
    public void run(String... args) {
        IceNioClient iceNioClient = new IceNioClient(properties.getApp(), properties.getServer(), properties.getPool().getParallelism(), properties.getMaxFrameLength());
        Runtime.getRuntime().addShutdownHook(new Thread(iceNioClient::destroy));
        iceNioClient.connect();
    }
}
 