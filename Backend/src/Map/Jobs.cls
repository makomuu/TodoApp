Class Backend.src.Map.Jobs Extends %CSP.REST
{

XData UrlMap
{
<Routes>
    <!-- タスク一覧取得 -->
    <Route Url="/jobs" Method="GET" Call="GetJobs"/>
    <!-- タスク新規作成 -->
    <Route Url="/jobs" Method="POST" Call="CreateJob"/>
    <!-- タスク編集 -->
    <Route Url="/jobs" Method="PUT" Call="UpdateJob"/>
    <!-- タスク削除 -->
    <Route Url="/jobs/ticketNo" Method="DELETE" Call="DeleteJob"/>
    </Routes>
}

/// タスク一覧取得
ClassMethod GetJobs() As %Status
{
    do GetJobs^Backend.src.Logic.Master.Job()

    return $$$OK
}

/// タスク新規作成
ClassMethod CreateJob() As %Status
{
    do CreateJob^Backend.src.Logic.Master.Job()

    return $$$OK
}

/// タスク編集
ClassMethod UpdateJob() As %Status
{
    do UpdateJob^Backend.src.Logic.Master.Job()

    return $$$OK
}

/// タスク削除
ClassMethod DeleteJob(ticketNo As %Integer) As %Status
{
    do DeleteJob^Backend.src.Logic.Master.Job(ticketNo)

    return $$$OK
}

}
