-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontoptimize
-dontwarn
-dontskipnonpubliclibraryclassmembers
-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
-dontskipnonpubliclibraryclassmembers
-target 1.6
-overloadaggressively
-useuniqueclassmembernames
-keeppackagenames
-repackageclasses ''
-keepattributes Exceptions,EnclosingMethod,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,LocalVariable*Table,*Annotation*,Synthetic,EnclosingMethod
-ignorewarnings

# Keep - Applications. Keep all application classes, along with their 'main'
# methods.
-keepclasseswithmembers public class * {
    public static void main(java.lang.String[]);
}

# Keep - Applets. Keep all extensions of java.applet.Applet.
-keep public class * extends java.applet.Applet

# Keep - Servlets. Keep all extensions of javax.servlet.Servlet.
-keep public class * extends javax.servlet.Servlet

# Keep - Midlets. Keep all extensions of javax.microedition.midlet.MIDlet.
-keep public class * extends javax.microedition.midlet.MIDlet

# Keep - Xlets. Keep all extensions of javax.tv.xlet.Xlet.
-keep public class * extends javax.tv.xlet.Xlet

# Keep - Library. Keep all public and protected classes, fields, and methods.
-keep public class * {
    public protected <fields>;
    public protected <methods>;
}


# Also keep - Serialization code. Keep all fields and methods that are used for
# serialization.
-keepclassmembers class * extends java.io.Serializable {
    static final long serialVersionUID;
    static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Also keep - BeanInfo classes. Keep all implementations of java.beans.BeanInfo.
-keep class * extends java.beans.BeanInfo


# Also keep - Database drivers. Keep all implementations of java.sql.Driver.
-keep class * extends java.sql.Driver

# Also keep - Swing UI L&F. Keep all extensions of javax.swing.plaf.ComponentUI,
# along with the special 'createUI' method.
-keep class * extends javax.swing.plaf.ComponentUI {
    public static javax.swing.plaf.ComponentUI createUI(javax.swing.JComponent);
}

# Also keep - RMI interfaces. Keep all interfaces that extend the
# java.rmi.Remote interface, and their methods.
-keep interface  * extends java.rmi.Remote {
    <methods>;
}

# Also keep - RMI implementations. Keep all implementations of java.rmi.Remote,
# including any explicit or implicit implementations of Activatable, with their
# two-argument constructors.
-keep class * extends java.rmi.Remote {
    <init>(java.rmi.activation.ActivationID,java.rmi.MarshalledObject);
}

# Keep names - Native method names. Keep all native class/method names.
-keepclasseswithmembers,allowshrinking class * {
    native <methods>;
}

# Keep names - _class method names. Keep all .class method names. This may be
# useful for libraries that will be obfuscated again with different obfuscators.
-keepclassmembers,allowshrinking class * {
    java.lang.Class class$(java.lang.String);
    java.lang.Class class$(java.lang.String,boolean);
}
-keep public class * extends android.app.Fragment
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.app.Dialog
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.support.v4.**
-keep public class com.android.vending.licensing.ILicensingService
-keep class android.support.** { *; }
-keep class com.android.internal.** { *; }
-keep class com.google.gson.** { *; }
-keepclasseswithmembernames class * {
    native <methods>;
}

-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context);
}

-keepattributes *Annotation*
-keepattributes *JavascriptInterface*

-dontnote android.support.**
-dontwarn com.android.internal.**
-dontwarn com.google.**
-dontwarn okio.**

#sophix
#基线包使用，生成mapping.txt
  -printmapping mapping.txt
  #生成的mapping.txt在app/buidl/outputs/mapping/release路径下，移动到/app路径下
  #修复后的项目使用，保证混淆结果一致
  #-applymapping mapping.txt
  #hotfix
  -keep class com.taobao.sophix.**{*;}
  -keep class com.ta.utdid2.device.**{*;}

 -keepclassmembers class com.lin.opensourcelist.SophixStubApplication{
  public <init>();
}
# 如果不使用android.support.annotation.Keep则需加上此行
# -keep class com.my.pkg.SophixStubApplication$RealApplicationStub







