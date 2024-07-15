Include Backend.src.Const.Sys

Class Backend.src.Map.Jobs Extends Backend.src.Base.RestBase
{

XData UrlMap
{
<Routes>
<!-- タスク一覧取得 -->
<Route Url="/:projectNo" Method="GET" Call="GetJobs"/>
<!-- タスク新規作成 -->
<Route Url="/:projectNo" Method="POST" Call="CreateJob"/>
<!-- タスク編集 -->
<Route Url="/:projectNo" Method="PUT" Call="UpdateJob"/>
<!-- タスク削除 -->
<Route Url="/:projectNo/:ticketNo" Method="DELETE" Call="DeleteJob"/>
</Routes>
}

/// タスク一覧取得
ClassMethod GetJobs() As %Status
{
    set projectNo = ..CallGetQueryOrDefault("projectNo")
    do ##class(Backend.src.Service.Master.JobService).GetJobs(projectNo)
    return $$$OK
}

/// タスク新規作成
ClassMethod CreateJob(projectNo) As %Status
{
    set requestObj = ..CallToRequestDynamicObject()
    do ##class(Backend.src.Service.Master.JobService).CreateJob(requestObj, projectNo)

    return $$$OK
}

/// タスク編集
ClassMethod UpdateJob(projectNo) As %Status
{
    set requestObj = ..CallToRequestDynamicObject()
    do ##class(Backend.src.Service.Master.JobService).UpdateJob(requestObj, projectNo)

    return $$$OK
}

/// タスク削除
ClassMethod DeleteJob(projectNo As %Integer, ticketNo As %Integer) As %Status
{
    do ##class(Backend.src.Service.Master.JobService).DeleteJob(projectNo, ticketNo)

    return $$$OK
}

}
