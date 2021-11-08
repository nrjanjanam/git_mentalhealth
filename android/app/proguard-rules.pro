# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class com.shockwave.**
-keep class org.apache.** { *; }
-keep class com.somejar.** { *; }
-keepnames class org.apache.commons.logging.impl.* {*;}
-keepnames class org.apache.commons.logging.*
-keepclassmembers class org.apache.commons.logging.impl.* {*;}
-keepclassmembers class org.apache.commons.logging.*
-keepnames interface org.apache.commons.logging.impl.* {*;}
-keepnames interface org.apache.commons.logging.*