package com.jibe;

import com.jibe.itfmqtt.MqttConnector;

public class Main {

    public static void main(String[] args) {
        System.out.println("coucou le monde");
        MqttConnector amqttcon = new MqttConnector();

        amqttcon.publish();

    }


}
