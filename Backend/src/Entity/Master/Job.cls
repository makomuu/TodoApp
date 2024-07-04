Include Backend.src.Const.Sys

/// ------------------------------------------------------------------------
/// ジョブクラス
/// ------------------------------------------------------------------------
Class Entity.Master.Job
{

/// チケット番号
Property TicketNo As %Integer;

/// プロジェクトNo
Property ProjectNo As %Integer;

/// タスク名
Property JobName As %String;

/// タスク内容
Property JobContent As %String;

/// ステータス（0:未着手 1:進行中 2:完了）
Property Status As %Integer;

/// 期限
Property Limit As %String;

Method %New()
{
}

/// Json取得・セット(Post:新規登録、Put:更新)
Method SetByJson(json As %DynamicObject)
{
        set ..TicketNo = json.%Get("ticketNo")
        set ..ProjectNo = json.%Get("projectNo")
        set ..JobName = json.%Get("jobName")
        set ..JobContent = json.%Get("jobContent")
        set ..Status = json.%Get("status")
        set ..Limit = json.%Get("limit")
}

/// グローバル作成
Method CreateLB()
{
        return $LB(
            ..ProjectNo,
            ..JobName,
            ..JobContent,
            ..Status,
            ..Limit
        )
}

/// Json作成
Method CreateJson() As %DynamicObject
{
        set json = ##class(%DynamicObject).%New()

        do json.%Set("ticketNo", ..TicketNo)
        do json.%Set("projectNo", ..ProjectNo)
        do json.%Set("jobName", ..JobName)
        do json.%Set("jobContent", ..JobContent)
        do json.%Set("status", ..Status)
        do json.%Set("limit", ..Limit)

        return json
}

Method SetByGlobal(ticketNo As %Integer)
{
    set glJob = $$$Job
    set ..TicketNo = ticketNo

    if (..Exists()) {
        set jobBuf = $G(@glJob@(ticketNo))
        set ..ProjectNo = $LG(jobBuf, 1)
        set ..JobName = $LG(jobBuf, 2)
        set ..JobContent = $LG(jobBuf, 3)
        set ..Status = $LG(jobBuf, 4)
        set ..Limit = $LG(jobBuf, 5)
    }
}

/// プロパティを使用して存在チェック
Method Exists() As %Boolean
{
    return ##class(Entity.Master.Job).MasterExists(..TicketNo)
}

/// 引数を使用してインスタンスに依存しない存在チェック
ClassMethod MasterExists(ticketNo As %Integer) As %Boolean
{
    return:(ticketNo = "") $$$False

    set glJob = $$$Job
    return $D(@glJob@(ticketNo))
}

/// グローバル作成
Method Register()
{
    set glJob = $$$Job
    set @glJob@(..TicketNo) = ..CreateLB()
}

/// グローバル削除
Method Delete()
{
    set glJob = $$$Job
    kill @glJob@(..ProjectNo)
}

}