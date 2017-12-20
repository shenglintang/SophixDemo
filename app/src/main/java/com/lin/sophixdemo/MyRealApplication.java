package com.lin.sophixdemo;

import android.app.Application;
import android.util.Log;

/**
 * Created by lin on 2017/12/19.
 */

public class MyRealApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        Log.e("lin", "MyRealApplication start" );
    }
}
