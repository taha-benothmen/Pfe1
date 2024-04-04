import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;

class AzureIoTHubService {
  final String iotHubHostName;
  final String clientId;
  final String willTopic;
  final String willMessage;
  final String publishTopic;

  mqtt.MqttClient? client;

  AzureIoTHubService({
    required this.iotHubHostName,
    required this.clientId,
    required this.willTopic,
    required this.willMessage,
    required this.publishTopic,
  });

  Future<void> connect() async {
    client = mqtt.MqttClient(iotHubHostName, clientId);
    client!.logging(on: true);

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(clientId)
        .withWillTopic(willTopic)
        .withWillMessage(willMessage)
        .startClean()
        .withWillQos(mqtt.MqttQos.atLeastOnce);

    print('Connecting to $iotHubHostName...');
    client!.connectionMessage = connMess;

    try {
      await client!.connect();
      print('Connected to Azure IoT Hub');
    } on mqtt.NoConnectionException catch (e) {
      print('Error connecting to Azure IoT Hub: $e');
      disconnect();
    }

    client!.updates!.listen((List<mqtt.MqttReceivedMessage<mqtt.MqttMessage>>? c) {
      final mqtt.MqttPublishMessage recMess = c![0].payload as mqtt.MqttPublishMessage;
      final pt = mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('Received message: $pt from topic: ${c[0].topic}');
    });
  }

  void publish(String message) {
    if (client != null && client!.connectionStatus!.state == mqtt.MqttConnectionState.connected) {
      final builder = mqtt.MqttClientPayloadBuilder();
      builder.addString(message);
      client!.publishMessage(publishTopic, mqtt.MqttQos.exactlyOnce, builder.payload!);
    }
  }

  void disconnect() {
    client?.disconnect();
  }
}
