package com.example.sa;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import org.jitsi.meet.sdk.JitsiMeetActivity;
import org.jitsi.meet.sdk.JitsiMeetConferenceOptions;
import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class meetingdetail extends AppCompatActivity {

    TextView chairname,confsname,confsroom,startTime,topic;
    String result,result2,result3,result4,result5;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_meetingdetail);

        chairname = findViewById(R.id.chairname);
        confsname = findViewById(R.id.confsname);
        confsroom = findViewById(R.id.confsroom);
        startTime = findViewById(R.id.startTime);
        topic = findViewById(R.id.topic);

        Thread thread = new Thread(mutiThread);
        thread.start();
    }

    public void meet(View view) {
        try {
            URL serverURL = new URL("https://meet.jit.si");
            JitsiMeetConferenceOptions conferenceOptions = new JitsiMeetConferenceOptions.Builder()
                    .setServerURL(serverURL)
                    .setWelcomePageEnabled(false)
                    .setRoom("liuroom1")
                    .build();
            JitsiMeetActivity.launch(meetingdetail.this, conferenceOptions);

        } catch (Exception e) {
            Toast.makeText(meetingdetail.this, e.getMessage(), Toast.LENGTH_SHORT).show();

        }
    }

    private Runnable mutiThread = new Runnable(){
        public void run()
        {
            try {
                URL url = new URL("http://172.20.10.10/sa/meeetdetail.php");
                // 開始宣告 HTTP 連線需要的物件，這邊通常都是一綑的
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                // 建立 Google 比較挺的 HttpURLConnection 物件
                connection.setRequestMethod("POST");
                // 設定連線方式為 POST
                connection.setDoOutput(true); // 允許輸出
                connection.setDoInput(true); // 允許讀入
                connection.setUseCaches(false); // 不使用快取
                connection.connect(); // 開始連線

                int responseCode =
                        connection.getResponseCode();
                // 建立取得回應的物件
                if(responseCode ==
                        HttpURLConnection.HTTP_OK){
                    // 如果 HTTP 回傳狀態是 OK ，而不是 Error
                    InputStream inputStream =
                            connection.getInputStream();
                    // 取得輸入串流
                    BufferedReader bufReader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"), 8);
                    // 讀取輸入串流的資料
                    String line = null; // 宣告讀取用的字串
                    while((line = bufReader.readLine()) != null) {
                        JSONArray dataJson = new JSONArray(line);
                        int i = dataJson.length()-1;
                        JSONObject info = dataJson.getJSONObject(i);
                        String chairname = info.getString("users_name");
                        String confsname = info.getString("confs_Name");
                        String confsroom = info.getString("roomID");
                        String startTime = info.getString("startTime");
                        String topic = info.getString("topic");
                        result = chairname.toString();
                        result2 = confsname.toString();
                        result3 = confsroom.toString();
                        result4 = startTime.toString();
                        result5 = topic.toString();
                    }
                    inputStream.close(); // 關閉輸入串流
                }
                // 讀取輸入串流並存到字串的部分
                // 取得資料後想用不同的格式
                // 例如 Json 等等，都是在這一段做處理

            } catch(Exception e) {
                result = e.toString(); // 如果出事，回傳錯誤訊息
                result2 = e.toString();
                result3 = e.toString();
                result4 = e.toString();
                result5 = e.toString();
            }

            // 當這個執行緒完全跑完後執行
            runOnUiThread(new Runnable() {
                public void run() {
                    chairname.setText(result); // 更改顯示文字
                    confsname.setText(result2);
                    confsroom.setText(result3);
                    startTime.setText(result4);
                    topic.setText(result5);
                }
            });
        }
    };
}