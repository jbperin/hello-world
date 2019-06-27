package com.example.helloandroid;

import android.app.Activity;
import android.os.Bundle;
import com.jibe.itfmqtt.MqttConnector;

public class MainActivity extends Activity {
   @Override
   protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
      
      MqttConnector amqttcon = new MqttConnector();

      amqttcon.publish();

   }
}
