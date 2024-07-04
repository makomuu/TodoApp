/// ----------------------------------------------------------
/// RESTディスパッチクラス
/// ----------------------------------------------------------
Class Backend.src.Path.Dispatcher Extends %CSP.REST
{

/// RESTのデフォルトのエンコーディングを指定
Parameter CHARSET = "UTF-8";

/// RESTのコンテンツタイプの指定
Parameter CONTENTTYPE = "application/x-www-form-urlencoded;application/json";

/// 入力されたストリームデータを自動的に文字列に変換
/// todo:ここよくわからない。
Parameter CONVERTINPUTSTREAM = 1;

/// セッション管理の有無（0はしない）
Parameter UseSession As INTEGER = 0;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- プロジェクト -->
<Map Prefix="/projects" Forward="Backend.src.Map.Projects" />
<!-- タスク -->
<Map Prefix="/jobs" Forward="Map.Jobs" />
</Routes>
}

}
