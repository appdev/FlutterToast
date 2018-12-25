package com.apkdv.toast;

import android.content.Context;
import android.content.res.Resources;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;


/**
 * Created by reiserx on 2017/8/16.
 * desc :弹窗
 */

public class ToastUtil {
    private static TextView mNextView;
    private static Toast mToast;
    private Context mContext;

    /**
     * 构造器
     *
     * @param context 上下文
     */
    public ToastUtil(Context context) {
        this.mContext = context;
    }

    /**
     * Toast显示
     *
     * @param context  上下文
     * @param text     显示文本
     * @param duration 显示时长
     * @return Toast
     */
    public static ToastUtil makeText(Context context, CharSequence text, int duration, int gravity) {
        ToastUtil toastUtil = new ToastUtil(context);
        View view = LayoutInflater.from(context.getApplicationContext()).inflate(R.layout.layout_toast, null);
        mNextView = view.findViewById(R.id.tv_text);
        mNextView.setText(text);
        mToast = new Toast(context.getApplicationContext());
        if (gravity == Gravity.BOTTOM)
            mToast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.BOTTOM, 0, dp2px(81));
        else if (gravity == Gravity.TOP)
            mToast.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.TOP, 0, dp2px(81));
        else mToast.setGravity(gravity, 0, 0);
        mToast.setDuration(duration);
        mToast.setView(view);
        return toastUtil;
    }

    /**
     * dp转px
     *
     * @param dpValue dp值
     * @return px值
     */
    private static int dp2px(float dpValue) {
        final float scale = Resources.getSystem().getDisplayMetrics().density;
        return (int) (dpValue * scale + 0.5f);
    }

    /**
     * Toast显示
     *
     * @param context  上下文
     * @param res      文本资源
     * @param duration 显示时长
     * @return Toast
     */
    public static ToastUtil makeText(Context context, String res, int duration) {
        return makeText(context, res, duration, Gravity.BOTTOM);
    }


    /**
     * Toast文本
     *
     * @param s 显示的文本
     */
    public void setText(CharSequence s) {
        if (mNextView != null) {
            mNextView.setText(s);
        }
    }

    /**
     * Toast显示
     */
    public void show() {
        if (mToast != null) {
            mToast.show();
        }
    }

    /**
     * Toast文字
     *
     * @param res 文字资源
     */
    public void setText(int res) {
        setText(mContext.getText(res));
    }

    /**
     * @param duration Toast时长
     */
    public void setDuration(int duration) {
        if (mToast != null) {
            mToast.setDuration(duration);
        }
    }

}
