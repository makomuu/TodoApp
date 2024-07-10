Include Backend.src.Const.Sys

/// ------------------------------------------------------------------------
/// プロジェクトクラス
/// ------------------------------------------------------------------------
Class Entity.Master.Project
{

/// プロジェクトNo
Property ProjectNo As %Integer;

/// プロジェクト名
Property ProjectName As %String;

/// 作成日
Property CreateDate As %String;

Method %New()
{
}

/// Json取得・セット(Post:新規登録、Put:更新)
Method SetByJson(json As %DynamicObject)
{
        set ..ProjectNo = json.%Get("projectNo")
        set ..ProjectName = json.%Get("projectName")
        set ..CreateDate = json.%Get("createDate")
}

/// グローバル作成
Method CreateLB()
{
        return $LB(
            ..ProjectName,
            ..CreateDate
        )
}

/// Json作成
Method CreateJson() As %DynamicObject
{
        set json = ##class(%DynamicObject).%New()

        do json.%Set("projectNo", ..ProjectNo)
        do json.%Set("projectName", ..ProjectName)
        do json.%Set("createDate", ..CreateDate)

        return json
}

/// レスポンス部分JSON作成
Method CreateResponseJSON()
{
    set jb = ##class(Backend.src.Utility.JsonBuilder).%New()
    set projectJSON = ..CreateJson()
    do jb.PushResult(projectJSON)
    do jb.WriteJSON()
}

/// 既存グローバルの内容をプロパティにセット
Method SetByGlobal(projectNo As %Integer)
{
    set glProject = $$$Project
    set ..ProjectNo = projectNo

    if (..Exists()) {
        set projectBuf = $G(@glProject@(projectNo))
        set ..ProjectName = $LI(projectBuf, 1)
        set ..CreateDate = $LI(projectBuf, 2)
    }
}

/// プロパティを使用して存在チェック
Method Exists() As %Boolean
{
    return ##class(Entity.Master.Project).MasterExists(..ProjectNo)
}

/// 引数を使用して存在チェック
ClassMethod MasterExists(projectNo As %Integer) As %Boolean
{
    return:(projectNo = "") $$$False
    set glProject = $$$Project
    return $D(@glProject@(projectNo))
}

/// グローバル作成
Method Register()
{
    set glProject = $$$Project
    set @glProject@(..ProjectNo) = ..CreateLB()
}

/// グローバル削除
Method Delete()
{
    set glProject = $$$Project
    kill @glProject@(..ProjectNo)
}

}
