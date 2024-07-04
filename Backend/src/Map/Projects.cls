Include Backend.src.Const.Sys

Class Backend.src.Map.Projects Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- プロジェクト一覧取得 -->
<Route Url="" Method="GET" Call="GetProjects" Cors="true"/>
<!-- プロジェクト作成 -->
<Route Url="" Method="POST" Call="CreateProject" Cors="true"/>
</Routes>
}

/// プロジェクト一覧取得
ClassMethod GetProjects() As %Status
{
    set num = 1
    do ##class(Backend.src.Service.Master.ProjectService).GetProjects(num)
    return $$$OK
}

/// プロジェクト新規作成
ClassMethod CreateProject() As %Status
{
    do ##class(Backend.src.Service.Master.ProjectService).CreateProject()
    return $$$OK
}

}
