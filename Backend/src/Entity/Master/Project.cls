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
