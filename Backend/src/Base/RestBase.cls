Include Backend.src.Const.Sys

/// ------------------------------------------------------------------------
/// REST基底クラス
/// ------------------------------------------------------------------------
Class Backend.src.Base.RestBase Extends %CSP.REST
{

/// クエリパラメータ取得処理呼び出し
ClassMethod CallGetQueryOrDefault(paramName As %String, defaultValue As %String = "")
{
    return ##class(Backend.src.Base.RestBase).GetQuery(%request, paramName, defaultValue)
}

/// クエリパラメータに一致する値を取得する
ClassMethod GetQuery(request As %CSP.Request, paramName As %String, defaultValue As %String = "") As %String
{
    return $G(request.Data(paramName, 1), defaultValue)
}

/// リクエストをDynamicObject変換処理呼び出し
ClassMethod CallToRequestDynamicObject() As %DynamicObject
{
    return ##class(Backend.src.Base.RestBase).ToRequestDynamicObject(%request)
}

/// 引数のリクエストからDynamicObject作成
ClassMethod ToRequestDynamicObject(request As %CSP.Request) As %DynamicObject
{
    set json = request.Content.Read()
    return ##class(%DynamicObject).%FromJSON(json)
}

}
