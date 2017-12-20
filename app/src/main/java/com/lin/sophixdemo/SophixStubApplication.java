package com.lin.sophixdemo;

import android.content.Context;
import android.support.annotation.Keep;
import android.util.Log;

import com.taobao.sophix.PatchStatus;
import com.taobao.sophix.SophixApplication;
import com.taobao.sophix.SophixEntry;
import com.taobao.sophix.SophixManager;
import com.taobao.sophix.listener.PatchLoadStatusListener;

/**
 * Created by lin on 2017/12/19.
 */

public class SophixStubApplication extends SophixApplication {
    private final String TAG = "SophixStubApplication";

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
//         如果需要使用MultiDex，需要在此处调用。
//         MultiDex.install(this);
        initSophix();
    }
    @Override
    public void onCreate() {
        super.onCreate();
        // queryAndLoadNewPatch不可放在attachBaseContext 中，否则无网络权限，建议放在后面任意时刻，如onCreate中
        /** 补丁在后台发布之后, 并不会主动下行推送到客户端, 客户端通过调用queryAndLoadNewPatch方法查询后台补丁是否可用*/
        SophixManager.getInstance().queryAndLoadNewPatch();
    }

    private void initSophix() {
        String appVersion = "1.0";
        try {
            appVersion = this.getPackageManager()
                    .getPackageInfo(this.getPackageName(), 0)
                    .versionName;
        } catch (Exception e) {
        }
        final SophixManager instance = SophixManager.getInstance();
        Log.e("lin", "appVersion= " + appVersion);
        instance.setContext(this)
                .setAppVersion(appVersion)
                .setSecretMetaData(null, null, null)
                .setEnableDebug(true)
                .setEnableFullLog()
                .setPatchLoadStatusStub(new PatchLoadStatusListener() {
                    @Override
                    public void onLoad(final int mode, final int code, final String info, final int handlePatchVersion) {
                        if (code == PatchStatus.CODE_LOAD_SUCCESS) {
                            Log.e(TAG, "sophix load patch success!");
                        } else if (code == PatchStatus.CODE_LOAD_RELAUNCH) {
                            // 如果需要在后台重启，建议此处用SharePreference保存状态。
                            Log.e(TAG, "sophix preload patch success. restart app to make effect.");
                        }else{
                            Log.e("lin", "code= " + code);
                            Log.e("lin", "mode= " + mode);
                            Log.e("lin", "info= " + info);
                            Log.e("lin", "handlePatchVersion= " + handlePatchVersion);
                        }
                    }
                }).initialize();
    }


    // 此处SophixEntry应指定真正的Application，并且保证RealApplicationStub类名不被混淆。
    @Keep
    @SophixEntry(MyRealApplication.class)
    static class RealApplicationStub {
    }

}
