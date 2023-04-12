#include <NusabotSimpleTimer.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>


NusabotSimpleTimer timer;
WiFiClient client;
HTTPClient http;

const char* ssid = "POCO X3 NFC";
const char* pass = "satuduatiga";

String serverName = "http:/192.168.50.254/monitoring/";
int pot, last_pot;

void kirimdata() {
  if (WiFi.status() == WL_CONNECTED) {
    if (pot != last_pot) {
      last_pot = pot;
      String serverPath = serverName + "adddata.php?serialnumber=" + ESP.getChipId() + "&sensor=pot&data=" + String(pot);
      http.begin(client, serverPath);

      int httpResponeCode = http.GET();
      Serial.print(httpResponeCode);

      if (httpResponeCode > 0) {
        Serial.print("Kode Respone :");
        Serial.println(httpResponeCode);
        String payload = http.getString();
        Serial.println(payload);
      } else {
        Serial.print("Error Code: ");
        Serial.println(httpResponeCode);
      }

      http.end();
    }

  } else {
    Serial.println("WiFi Terputus");
  }
}

void setup() {
  Serial.begin(115200);

  WiFi.begin(ssid, pass);
  Serial.print("Menghubungkan ke WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.print("Terhubung ke WiFi Dengan IP Address:");
  Serial.println(WiFi.localIP());

  timer.setInterval(2000, kirimdata);
}

void loop() {
  timer.run();
  pot = analogRead(A0);
}
