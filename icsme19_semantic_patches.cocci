// ###2
// DEPRECATED METHOD
// Package Name: android.accounts
// Class Name: AccountManager
// Method Name: getAuthToken
// Parameters: android.accounts.Account,java.lang.String,boolean,android.accounts.AccountManagerCallback<android.os.Bundle>,android.os.Handler
// Return Type: android.accounts.AccountManagerFuture<android.os.Bundle>
// 
// REPLACEMENT METHOD
// Package Name: android.accounts
// Class Name: AccountManager
// Method Name: getAuthToken
// Parameters: android.accounts.Account,java.lang.String,android.os.Bundle,boolean,android.accounts.AccountManagerCallback<android.os.Bundle>,android.os.Handler
// Return Type: android.accounts.AccountManagerFuture<android.os.Bundle>
// 
// ###Patch
@hascall2@
expression accountmanager;
expression a0;
expression a1;
expression a2;
expression a3;
expression a4;
@@
accountmanager.getAuthToken(a0,a1,a2,a3,a4)

@hasinc2a@
@@
import android.accounts.Account;

@hasinc2b@
@@
import android.accounts.AccountManagerCallback;

@hasinc2c@
@@
import android.os.Bundle;

@hasinc2d@
@@
import android.os.Handler;

@hasinc2e depends on hasinc2a && hasinc2b && hasinc2c && hasinc2d && hascall2@
@@
import android.accounts.AccountManager;
+import android.os.Bundle;

@depends on hasinc2e@
expression accountmanager;
expression a0;
expression a1;
expression a2;
expression a3;
expression a4;
@@
-accountmanager.getAuthToken(a0,a1,a2,a3,a4)
+accountmanager.getAuthToken(a0,a1,null,a2,a3,a4)

// ###5
// DEPRECATED METHOD
// Package Name: android.app
// Class Name: ActivityManager
// Method Name: restartPackage
// Parameters: java.lang.String
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.app
// Class Name: ActivityManager
// Method Name: killBackgroundProcesses
// Parameters: java.lang.String
// Return Type: void
// 
// ###Patch
@hasinc5@
@@
import android.app.ActivityManager;

@depends on hasinc5@
expression activitymanager;
expression a0;
@@
-activitymanager.restartPackage(a0)
+activitymanager.killBackgroundProcesses(a0)

// ###7
// DEPRECATED METHOD
// Package Name: android.app
// Class Name: Fragment
// Method Name: onInflate
// Parameters: android.util.AttributeSet,android.os.Bundle
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.app
// Class Name: Fragment
// Method Name: onInflate
// Parameters: android.app.Activity,android.util.AttributeSet,android.os.Bundle
// Return Type: void
// 
// ###Patch
@hasdef7@
identifier a0;
identifier a1;
@@
void onInflate(AttributeSet a0,Bundle a1){ ... }

@hasinc7a@
@@
import android.util.AttributeSet;

@hasinc7b@
@@
import android.os.Bundle;

@hasinc7c depends on hasinc7a && hasinc7b && hasdef7@
@@
import android.app.Fragment;
+import android.app.Activity;

@depends on hasinc7c@
identifier a0;
identifier a1;
fresh identifier a2;
@@
-void onInflate(AttributeSet a0,Bundle a1){
+void onInflate(Activity a2,AttributeSet a0,Bundle a1){
...
}

// ###14
// DEPRECATED METHOD
// Package Name: android.app
// Class Name: Activity
// Method Name: onCreateDialog
// Parameters: int
// Return Type: android.app.Dialog
// 
// REPLACEMENT METHOD
// Package Name: android.app
// Class Name: Activity
// Method Name: onCreateDialog
// Parameters: int,android.os.Bundle
// Return Type: android.app.Dialog
// 
// ###Patch
@hasdef14@
identifier a0;
@@
// have to rely on an isomorphism to get the full type name
/*android.app.*/Dialog onCreateDialog(int a0){ ... }

@hasinc14 depends on hasdef14@
@@
import android.app.Activity;
+import android.os.Bundle;

@depends on hasinc14@
identifier a0;
fresh identifier a1;
@@
  /*android.app.*/Dialog
- onCreateDialog(int a0){
+ onCreateDialog(int a0,Bundle a1){
...
}

// ###16
// DEPRECATED METHOD
// Package Name: android.app
// Class Name: Activity
// Method Name: onPrepareDialog
// Parameters: int,android.app.Dialog
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.app
// Class Name: Activity
// Method Name: onPrepareDialog
// Parameters: int,android.app.Dialog,android.os.Bundle
// Return Type: void
// 
// ###Patch
@hasdef16@
identifier a0;
identifier a1;
@@
void onPrepareDialog(int a0,Dialog a1){ ... }

@hasinc16a@
@@
import android.app.Dialog;

@hasinc16b depends on hasinc16a && hasdef16@
@@
import android.app.Activity;
+import android.os.Bundle;

@depends on hasinc16b@
identifier a0;
identifier a1;
fresh identifier a2;
@@
-void onPrepareDialog(int a0,Dialog a1){
+void onPrepareDialog(int a0,Dialog a1,Bundle a2){
...
}

// ###18
// DEPRECATED METHOD
// Package Name: android.app
// Class Name: Activity
// Method Name: showDialog
// Parameters: int
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.app
// Class Name: Activity
// Method Name: showDialog
// Parameters: int,android.os.Bundle
// Return Type: void
// 
// ###Patch
@matching18@
identifier method;
expression activityExpr;
expression a0;
@@
method(...){
<+...
activityExpr.showDialog(a0)
...+>
}
@@
expression a0;
expression activityExpr;
identifier matching18.method;
fresh identifier myMethod;
@@
+void myMethod(Activity activity,int i0)
+{
+  activity.showDialog(i0,null);
+}
+

method(...){
<+...
-activityExpr.showDialog(a0)
+myMethod(activityExpr,a0)
...+>
}

// ###28
// DEPRECATED METHOD
// Package Name: android.app.Notification
// Class Name: Builder
// Method Name: getNotification
// Parameters: 
// Return Type: android.app.Notification
// 
// REPLACEMENT METHOD
// Package Name: android.app.Notification
// Class Name: Builder
// Method Name: build
// Parameters: 
// Return Type: android.app.Notification
// 
// ###Patch
@hasinc28@
@@
import android.app.Notification.Builder;

@depends on hasinc28@
expression builder;
@@
-builder.getNotification()
+builder.build()

// ###29
// DEPRECATED METHOD
// Package Name: android.app
// Class Name: Service
// Method Name: onStart
// Parameters: android.content.Intent,int
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.app
// Class Name: Service
// Method Name: onStartCommand
// Parameters: android.content.Intent,int,int
// Return Type: void
// 
// ###Patch
@hasinc29a@
@@
import android.content.Intent;

@hasinc29b@
@@
import android.app.Service;

@depends on hasinc29a && hasinc29b@
identifier a0;
fresh identifier a1;
fresh identifier a2;
@@
-void onStart(Intent a0,int a1){
+void onStartCommand(Intent a0,int a2,int a1){
...
}

// ###34
// DEPRECATED METHOD
// Package Name: android.content
// Class Name: ContentResolver
// Method Name: getCurrentSync
// Parameters: 
// Return Type: android.content.SyncInfo
// 
// REPLACEMENT METHOD
// Package Name: android.content
// Class Name: ContentResolver
// Method Name: getCurrentSyncs
// Parameters: 
// Return Type: java.util.List<android.content.SyncInfo>
// 
// ###Patch
@matching34@
identifier method;
@@
method(...){
<+...
contentresolver.getCurrentSync()
...+>
}
@@
expression contentresolver;
identifier matching34.method;
@@
+android.content.SyncInfo myMethod(ContentResolver contentresolver)
+{
+  try {
+    final java.util.List<SyncInfo> syncs=contentresolver.getContentService().getCurrentSyncs();
+    if (syncs.isEmpty()) {
+      return null;
+    }
+    return syncs.get(0);
+  }
+ catch (  RemoteException e) {
+    throw new RuntimeException("the ContentService should always be reachable",java.io.OutputStream);
+  }
+}
+

method(...){
<+...
-contentresolverExpr.getCurrentSync()
+myMethod(contentresolverExpr)
...+>
}
// ###37
// DEPRECATED METHOD
// Package Name: android.content
// Class Name: ClipboardManager
// Method Name: hasText
// Parameters: 
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.content
// Class Name: ClipboardManager
// Method Name: hasPrimaryClip
// Parameters: 
// Return Type: boolean
// 
// ###Patch
@hasinc37@
@@
import android.content.ClipboardManager;
...

@depends on hasinc37@
expression clipboardmanager;
@@
-clipboardmanager.hasText();
+clipboardmanager.hasPrimaryClip();

// ###51
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: ContentObservable
// Method Name: dispatchChange
// Parameters: boolean
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: ContentObservable
// Method Name: dispatchChange
// Parameters: boolean,android.net.Uri
// Return Type: void
// 
// ###Patch
@matching51@
identifier method;
expression contentobservableExpr;
expression a0;
@@
method(...){
<+...
contentobservableExpr.dispatchChange(a0)
...+>
}
@@
expression a0;
expression contentobservableExpr;
identifier matching51.method;
fresh identifier myMethod;
@@
+void myMethod(ContentObservable contentobservable,boolean b0)
+{
+  contentobservable.dispatchChange(b0,null);
+}
+

method(...){
<+...
-contentobservableExpr.dispatchChange(a0)
+myMethod(contentobservableExpr,a0)
...+>
}
// ###52
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: Cursor
// Method Name: deactivate
// Parameters: 
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: Cursor
// Method Name: requery
// Parameters: 
// Return Type: void
// 
// ###Patch
@hasinc52@
@@
import android.database.Cursor;
...

@depends on hasinc52@
expression cursor;
@@
-cursor.deactivate();
+cursor.requery();

// ###54
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: isNull
// Parameters: int,int
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: getType
// Parameters: int,int
// Return Type: int
// 
// ###Patch
@matching54@
identifier method;
expression cursorwindowExpr;
expression a0;
expression a1;
@@
method(...){
<+...
cursorwindowExpr.isNull(a0,a1)
...+>
}
@@
expression a0;
expression a1;
expression cursorwindowExpr
identifier matching54.method;
fresh identifier myMethod;
@@
+boolean myMethod(CursorWindow cursorwindow,int i0,int i1)
+{
+  return cursorwindow.getType(a0,a1) == Cursor.FIELD_TYPE_NULL;
+}
+

method(...){
<+...
-cursorwindowExpr.isNull(a0,a1)
+myMethod(cursorwindowExpr,a0,a1)
...+>
}

// ###55
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: isBlob
// Parameters: int,int
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: getType
// Parameters: int,int
// Return Type: int
// 
// ###Patch
@matching55@
identifier method;
expression cursorwindowExpr;
expression a0;
expression a1;
@@
method(...){
<+...
cursorwindowExpr.isBlob(a0,a1)
...+>
}
@@
expression a0;
expression a1;
expression cursorwindowExpr;
identifier matching55.method;
fresh identifier myMethod;
@@
+boolean myMethod(CursorWindow cursorwindow,int i0,int i1)
+{
+  int type=cursorwindow.getType(i0,i1);
+  return type == Cursor.FIELD_TYPE_BLOB || type == Cursor.FIELD_TYPE_NULL;
+}
+

method(...){
<+...
-cursorwindowExpr.isBlob(a0,a1)
+myMethod(cursorwindowExpr,a0,a1)
...+>
}
// ###56
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: isLong
// Parameters: int,int
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: getType
// Parameters: int,int
// Return Type: int
// 
// ###Patch
@matching56@
identifier method;
expression cursorwindowExpr;
expression a0;
expression a1;
@@
method(...){
<+...
cursorwindowExpr.isLong(a0,a1)
...+>
}
@@
expression a0;
expression a1;
expression cursorwindowExpr;
identifier matching56.method;
fresh identifier myMethod;
@@
+boolean myMethod(CursorWindow cursorwindow,int i0,int i1)
+{
+  return cursorwindow.getType(i0,i1) == Cursor.FIELD_TYPE_INTEGER;
+}
+

method(...){
<+...
-cursorwindowExpr.isLong(a0,a1)
+myMethod(cursorwindowExpr,a0,a1)
...+>
}
// ###57
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: isFloat
// Parameters: int,int
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: getType
// Parameters: int,int
// Return Type: int
// 
// ###Patch
@matching57@
identifier method;
expression cursorwindowExpr;
expression a0;
expression a1;
@@
method(...){
<+...
cursorwindowExpr.isFloat(a0,a1)
...+>
}
@@
expression a0;
expression a1;
expression cursorwindowExpr;
identifier matching57.method;
fresh identifier myMethod;
@@
+boolean myMethod(CursorWindow cursorwindow,int i0,int i1)
+{
+  return cursorwindow.getType(i0,i1) == Cursor.FIELD_TYPE_FLOAT;
+}
+

method(...){
<+...
-cursorwindowExpr.isFloat(a0,a1)
+myMethod(cursorwindowExpr,a0,a1)
...+>
}

// ###58
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: isString
// Parameters: int,int
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: CursorWindow
// Method Name: getType
// Parameters: int,int
// Return Type: int
// 
// ###Patch
@matching58@
identifier method;
expression cursorwindowExpr;
expression a0;
expression a1;
@@
method(...){
<+...
cursorwindowExpr.isString(a0,a1)
...+>
}
@@
expression a0;
expression a1;
expression cursorwindowExpr;
identifier matching58.method;
fresh identifier myMethod;
@@
+boolean myMethod(CursorWindow cursorwindow,int i0,int i1)
+{
+  int type=cursorwindow.getType(i0,i1);
+  return type == Cursor.FIELD_TYPE_STRING || type == Cursor.FIELD_TYPE_NULL;
+}
+

method(...){
<+...
-cursorwindowExpr.isString(a0,a1)
+myMethod(cursorwindowExpr,a0,a1)
...+>
}

// ###59
// DEPRECATED METHOD
// Package Name: android.database
// Class Name: ContentObserver
// Method Name: dispatchChange
// Parameters: boolean
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.database
// Class Name: ContentObserver
// Method Name: dispatchChange
// Parameters: boolean,android.net.Uri
// Return Type: void
// 
// ###Patch
@matching59@
identifier method;
expression contentobserverExpr;
expression a0;
@@
method(...){
<+...
contentobserverExpr.dispatchChange(a0)
...+>
}
@@
expression a0;
expression contentobserverExpr;
identifier matching59.method;
fresh identifier myMethod;
@@
+void myMethod(ContentObserver contentobserver,boolean b0)
+{
+  contentobserver.dispatchChange(b0,null);
+}
+

method(...){
<+...
-contentobserverExpr.dispatchChange(a0)
+myMethod(contentobserverExpr,a0)
...+>
}

// ###60
// DEPRECATED METHOD
// Package Name: android.database.sqlite
// Class Name: SQLiteQueryBuilder
// Method Name: buildQuery
// Parameters: java.lang.String[],java.lang.String,java.lang.String[],java.lang.String,java.lang.String,java.lang.String,java.lang.String
// Return Type: java.lang.String
// 
// REPLACEMENT METHOD
// Package Name: android.database.sqlite
// Class Name: SQLiteQueryBuilder
// Method Name: buildQuery
// Parameters: java.lang.String[],java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String
// Return Type: java.lang.String
// 
// ###Patch
@hasinc60@
@@
import android.database.sqlite.SQLiteQueryBuilder;

@depends on hasinc60@
expression sqlitequerybuilder;
expression a0;
expression a1;
expression a2;
expression a3;
expression a4;
expression a5;
expression a6;
@@
-sqlitequerybuilder.buildQuery(a0,a1,a2,a3,a4,a5,a6);
+sqlitequerybuilder.buildQuery(a0,a1,a3,a4,a5,a6);

// ###72
// DEPRECATED METHOD
// Package Name: android.net
// Class Name: ConnectivityManager
// Method Name: getBackgroundDataSetting
// Parameters: 
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.net
// Class Name: ConnectivityManager
// Method Name: getActiveNetworkInfo
// Parameters: 
// Return Type: android.net.NetworkInfo
// 
// ###Patch
@hasinc72@
@@
import android.net.ConnectivityManager;

@depends on hasinc72@
expression connectivitymanager;
@@
-connectivitymanager.getBackgroundDataSetting();
+connectivitymanager.getActiveNetworkInfo().isConnectedOrConnecting();

// ###97
// DEPRECATED METHOD
// Package Name: android.test
// Class Name: InstrumentationTestCase
// Method Name: injectInsrumentation
// Parameters: android.app.Instrumentation
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.test
// Class Name: InstrumentationTestCase
// Method Name: injectInstrumentation
// Parameters: android.app.Instrumentation
// Return Type: void
// 
// ###Patch
@hascall97@
@@
expression instrumentationtestcase;
expression a0;
@@
instrumentationtestcase.injectInsrumentation(a0);

@hasinc97a@
@@
import android.app.Instrumentation;

@hasinc97b depends on hasinc97a && hascall97@
@@
import android.test.InstrumentationTestCase;

@depends on hasinc97b@
expression instrumentationtestcase;
expression a0;
@@
-instrumentationtestcase.injectInsrumentation(a0);
+instrumentationtestcase.injectInstrumentation(a0);

// ###100
// DEPRECATED METHOD
// Package Name: android.text.format
// Class Name: Formatter
// Method Name: formatIpAddress
// Parameters: int
// Return Type: java.lang.String
// 
// REPLACEMENT METHOD
// Package Name: java.net
// Class Name: InetAddress
// Method Name: getHostAddress
// Parameters: 
// Return Type: java.lang.String
// 
// ###Patch
@matching100@
identifier method;
expression formatterExpr;
expression a0;
@@
method(...){
<+...
formatterExpr.formatIpAddress(a0)
...+>
}
@@
expression a0;
expression formatterExpr;
identifier matching100.method;
fresh identifier myMethod;
@@
+java.lang.String myMethod(Formatter formatter,int a0)
+{
+  return android.net.NetworkUtils.intToInetAddress(a0).getHostAddress();
+}
+

method(...){
<+...
-formatterExpr.formatIpAddress(a0)
+myMethod(formatterExpr,a0)
...+>
}

// ###103
// DEPRECATED METHOD
// Package Name: android.view
// Class Name: View
// Method Name: setBackgroundDrawable
// Parameters: android.graphics.drawable.Drawable
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.view
// Class Name: View
// Method Name: setBackground
// Parameters: android.graphics.drawable.Drawable
// Return Type: void
// 
// ###Patch
@hascall103@
expression view;
expression a0;
@@
view.setBackgroundDrawable(a0);

@hasinc103a@
@@
import android.graphics.drawable.Drawable;

@hasinc103b depends on hasinc103a && hascall103@
@@
import android.view.View;

@depends on hasinc103b@
expression view;
expression a0;
@@
-view.setBackgroundDrawable(a0);
+view.setBackground(a0);

// ###108
// DEPRECATED METHOD
// Package Name: android.view
// Class Name: KeyEvent
// Method Name: getKeyboardDevice
// Parameters: 
// Return Type: int
// 
// REPLACEMENT METHOD
// Package Name: android.view
// Class Name: KeyEvent
// Method Name: getDeviceId
// Parameters: 
// Return Type: int
// 
// ###Patch
@hasinc108@
@@
import android.view.KeyEvent;

@depends on hasinc108@
expression keyevent;
@@
-keyevent.getKeyboardDevice();
+keyevent.getDeviceId();
// ###110
// DEPRECATED METHOD
// Package Name: android.view
// Class Name: KeyEvent
// Method Name: dispatch
// Parameters: android.view.KeyEvent.Callback
// Return Type: boolean
// 
// REPLACEMENT METHOD
// Package Name: android.view
// Class Name: KeyEvent
// Method Name: dispatch
// Parameters: android.view.KeyEvent.Callback,android.view.KeyEvent.DispatcherState,java.lang.Object
// Return Type: boolean
// 
// ###Patch
@hascall110@
@@
expression keyevent;
expression a0;
@@
keyevent.dispatch(a0);

@hasinc110a@
@@
import android.view.KeyEvent.Callback;

@hasinc110b depends on hasinc110a && hascall110@
@@
import android.view.KeyEvent;
+import android.view.KeyEvent.DispatcherState;

@depends on hasinc110b@
expression keyevent;
expression a0;
@@
-keyevent.dispatch(a0);
+keyevent.dispatch(a0,null,null);

// ###112
// DEPRECATED METHOD
// Package Name: android.view
// Class Name: MotionEvent
// Method Name: obtain
// Parameters: long,long,int,int,float,float,float,float,int,float,float,int,int
// Return Type: android.view.MotionEvent
// 
// REPLACEMENT METHOD
// Package Name: android.view
// Class Name: MotionEvent
// Method Name: obtain
// Parameters: long,long,int,float,float,float,float,int,float,float,int,int
// Return Type: android.view.MotionEvent
// 
// ###Patch
@matching112@
identifier method;
expression motioneventExpr;
expression a0;
expression a1;
expression a2;
expression a3;
expression a4;
expression a5;
expression a6;
expression a7;
expression a8;
expression a9;
expression a10;
expression a11;
expression a12;
@@
method(...){
<+...
motioneventExpr.obtain(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12)
...+>
}
@@
expression a0;
expression a1;
expression a2;
expression a3;
expression a4;
expression a5;
expression a6;
expression a7;
expression a8;
expression a9;
expression a10;
expression a11;
expression a12;
expression motioneventExpr;
identifier matching112.method;
fresh identifier myMethod;
@@
+android.view.MotionEvent myMethod(MotionEvent motionevent,long b0,long b1,int b2,int b3,float b4,float b5,float b6,float b7,int b8,float b9,float b10,int b11,int b12)
+{
+  return motionevent.obtain(b0,b1,b2,b4,b5,b6,b7,b8,b9,b10,b11,b12);
+}
+

method(...){
<+...
-motioneventExpr.obtain(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12)
+myMethod(motioneventExpr,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12)
...+>
}
// ###113
// DEPRECATED METHOD
// Package Name: android.view
// Class Name: ViewTreeObserver
// Method Name: removeGlobalOnLayoutListener
// Parameters: android.view.ViewTreeObserver.OnGlobalLayoutListener
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.view
// Class Name: ViewTreeObserver
// Method Name: removeOnGlobalLayoutListener
// Parameters: android.view.ViewTreeObserver.OnGlobalLayoutListener
// Return Type: void
// 
// ###Patch
@hascall113@
expression viewtreeobserver;
expression a0;
@@
viewtreeobserver.removeGlobalOnLayoutListener(a0);

@hasinc113a@
@@
import android.view.ViewTreeObserver.OnGlobalLayoutListener;

@hasinc113b depends on hasinc113a && hascall113@
@@
import android.view.ViewTreeObserver;

@depends on hasinc113b@
expression viewtreeobserver;
expression a0;
@@
-viewtreeobserver.removeGlobalOnLayoutListener(a0);
+viewtreeobserver.removeOnGlobalLayoutListener(a0);

// ###128
// DEPRECATED METHOD
// Package Name: android.view
// Class Name: ActionProvider
// Method Name: onCreateActionView
// Parameters: 
// Return Type: android.view.View
// 
// REPLACEMENT METHOD
// Package Name: android.view
// Class Name: ActionProvider
// Method Name: onCreateActionView
// Parameters: android.view.MenuItem
// Return Type: android.view.View
// 
// ###Patch
@hasdef128@
@@
/*android.view./*View onCreateActionView(){ ... }

@hasinc128 depends on hasdef128@
@@
import android.view.ActionProvider;
+import android.view.MenuItem;

@depends on hasinc128@
fresh identifier a0;ßß
@@
-/*android.view./*View onCreateActionView(){
+/*android.view./*View onCreateActionView(MenuItem a0){
...
}

// ###129
// DEPRECATED METHOD
// Package Name: android.view.accessibility
// Class Name: AccessibilityManager
// Method Name: getAccessibilityServiceList
// Parameters: 
// Return Type: java.lang.List<android.content.pm.ServiceInfo>
// 
// REPLACEMENT METHOD
// Package Name: android.view.accessibility
// Class Name: AccessibilityManager
// Method Name: getInstalledAccessibilityServiceList
// Parameters: 
// Return Type: java.lang.List<android.content.pm.ServiceInfo>
// 
// ###Patch
@matching129@
identifier method;
expression accessibilitymanagerExpr;
@@
method(...){
<+...
accessibilitymanager.getAccessibilityServiceList()
...+>
}
@@
expression accessibilitymanagerExpr;
identifier matching129.method;
fresh identifier myMethod;
@@
+java.lang.List<android.content.pm.ServiceInfo> myMethod(AccessibilityManager accessibilitymanager)
+{
+  java.util.concurrent.CopyOnWriteArrayList<android.accessibilityservice.AccessibilityServiceInfo> infos=accessibilitymanager.getInstalledAccessibilityServiceList();
+  java.util.concurrent.CopyOnWriteArrayList<android.content.pm.ServiceInfo> services=new java.util.concurrent.CopyOnWriteArrayList<android.content.pm.ServiceInfo>();
+  final int infoCount=infos.size();
+  for (int i=0; i < infoCount; i++) {
+    android.accessibilityservice.AccessibilityServiceInfo info=infos.get(i);
+    services.add(info.getResolveInfo().serviceInfo);
+  }
+  return Collections.unmodifiableList(services);
+}
+

method(...){
<+...
-accessibilitymanagerExpr.getAccessibilityServiceList()
+myMethod(accessibilitymanagerExpr)
...+>
}

// ###131
// DEPRECATED METHOD
// Package Name: android.view.textservice
// Class Name: SpellCheckerSession
// Method Name: getSuggestions
// Parameters: android.view.textservice.TextInfo[],int,boolean
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.view.textservice
// Class Name: SpellCheckerSession
// Method Name: getSentenceSuggestions
// Parameters: android.view.textservice.TextInfo[],int
// Return Type: void
// 
// ###Patch
@hascall131@
expression spellcheckersession;
expression a0;
expression a1;
expression a2;
@@
spellcheckersession.getSuggestions(a0,a1,a2);

@hasinc131a@
@@
import android.view.textservice.TextInfo;

@hasinc131b depends on hasinc131a && hascall131@
@@
import android.view.textservice.SpellCheckerSession;

@depends on hasinc131b@
expression spellcheckersession;
expression a0;
expression a1;
expression a2;
@@
-spellcheckersession.getSuggestions(a0,a1,a2);
+spellcheckersession.getSentenceSuggestions(a0,a1);

// ###133
// DEPRECATED METHOD
// Package Name: android.webkit
// Class Name: WebSettings
// Method Name: getTextSize
// Parameters: 
// Return Type: android.webkit.WebSettings.TextSize
// 
// REPLACEMENT METHOD
// Package Name: android.webkit
// Class Name: WebSettings
// Method Name: getTextZoom
// Parameters: 
// Return Type: int
// 
// ###Patch
@matching133@
identifier method;
expression websettingsExpr;
@@
method(...){
<+...
websettingsExpr.getTextSize()
...+>
}
@@
expression websettingsExpr;
identifier matching133.method;
fresh identifier myMethod;
@@
+android.webkit.WebSettings.TextSize myMethod(WebSettings websettings)
+{
+  TextSize closestSize=null;
+  int smallestDelta=Integer.MAX_VALUE;
+  int textSize=websettings.getTextZoom();
+  for (  TextSize size : TextSize.values()) {
+    int delta=Math.abs(textSize - size.value);
+    if (delta == 0) {
+      return size;
+    }
+    if (delta < smallestDelta) {
+      smallestDelta=delta;
+      closestSize=size;
+    }
+  }
+  return closestSize != null ? closestSize : TextSize.NORMAL;
+}
+

method(...){
<+...
-websettingsExpr.getTextSize()
+myMethod(websettingsExpr)
...+>
}

// ###162
// DEPRECATED METHOD
// Package Name: android.widget
// Class Name: AutoCompleteTextView
// Method Name: getItemClickListener
// Parameters: 
// Return Type: android.widget.AdapterView.OnItemClickListener
// 
// REPLACEMENT METHOD
// Package Name: android.widget
// Class Name: AutoCompleteTextView
// Method Name: getOnItemClickListener
// Parameters: 
// Return Type: android.widget.AdapterView.OnItemClickListener
// 
// ###Patch
@hasinc162@
@@
import android.widget.AutoCompleteTextView;

@depends on hasinc162@
expression autocompletetextview;
@@
-autocompletetextview.getItemClickListener();
+autocompletetextview.getOnItemClickListener();

// ###163
// DEPRECATED METHOD
// Package Name: android.widget
// Class Name: AutoCompleteTextView
// Method Name: getItemSelectedListener
// Parameters: 
// Return Type: android.widget.AdapterView.OnItemSelectedListener
// 
// REPLACEMENT METHOD
// Package Name: android.widget
// Class Name: AutoCompleteTextView
// Method Name: getOnItemSelectedListener
// Parameters: 
// Return Type: android.widget.AdapterView.OnItemSelectedListener
// 
// ###Patch
@hasinc163@
@@
import android.widget.AutoCompleteTextView;

@depends on hasinc163@
expression autocompletetextview;
@@
-autocompletetextview.getItemSelectedListener();
+autocompletetextview.getOnItemSelectedListener();

// ###164
// DEPRECATED METHOD
// Package Name: android.widget
// Class Name: ImageView
// Method Name: setAlpha
// Parameters: int
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.widget
// Class Name: ImageView
// Method Name: setImageAlpha
// Parameters: int
// Return Type: void
// 
// ###Patch
@hasinc164@
@@
import android.widget.ImageView;

@depends on hasinc164@
expression imageview;
expression a0;
@@
-imageview.setAlpha(a0);
+imageview.setImageAlpha(a0);

// ###166
// DEPRECATED METHOD
// Package Name: android.widget
// Class Name: RemoteViews
// Method Name: setRemoteAdapter
// Parameters: int,int,android.content.Intent
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.widget
// Class Name: RemoteViews
// Method Name: setRemoteAdapter
// Parameters: int,android.content.Intent
// Return Type: void
// 
// ###Patch
@hasinc166a@
@@
import android.content.Intent;

@hasinc166b depends on hasinc166a@
import android.widget.RemoteViews;

@depends on hasinc166b@
@@
expression remoteviews;
expression a0;
expression a1;
expression a2;
@@
-remoteviews.setRemoteAdapter(a0,a1,a2);
+remoteviews.setRemoteAdapter(a1,a2);

// ###168
// DEPRECATED METHOD
// Package Name: android.drm
// Class Name: DrmSupportInfo
// Method Name: getDescriprition
// Parameters: 
// Return Type: java.lang.String
// 
// REPLACEMENT METHOD
// Package Name: android.drm
// Class Name: DrmSupportInfo
// Method Name: getDescription
// Parameters: 
// Return Type: java.lang.String
// 
// ###Patch
@hasinc168@
@@
import android.drm.DrmSupportInfo;

@depends on hasinc168@
expression drmsupportinfo;
@@
-drmsupportinfo.getDescriprition();
+drmsupportinfo.getDescription();

// ###203
// DEPRECATED METHOD
// Package Name: android.test
// Class Name: AndroidTestRunner
// Method Name: setInstrumentaiton
// Parameters: android.app.Instrumentation
// Return Type: void
// 
// REPLACEMENT METHOD
// Package Name: android.test
// Class Name: AndroidTestRunner
// Method Name: setInstrumentation
// Parameters: android.app.Instrumentation
// Return Type: void
// 
// ###Patch
@hascall203@
expression androidtestrunner;
expression a0;
@@
androidtestrunner.setInstrumentaiton(a0);

@hasinc203a@
@@
import android.app.Instrumentation;

@hasinc203b depends on hasinc203a && hascall203@
import android.test.AndroidTestRunner;

@depends on hasinc203b@
expression androidtestrunner;
expression a0;
@@
-androidtestrunner.setInstrumentaiton(a0);
+androidtestrunner.setInstrumentation(a0);

