Include Backend.src.Const.Sys

Class Backend.src.Map.Projects Extends Backend.src.Base.RestBase
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- プロジェクト一覧取得 -->
<Route Url="" Method="GET" Call="GetProjects" Cors="true"/>
<!-- プロジェクト作成 -->
<Route Url="" Method="POST" Call="CreateProject" Cors="true"/>
<!-- プロジェクト作成 -->
<Route Url="" Method="PUT" Call="UpdateProject" Cors="true"/>
</Routes>
}

/// プロジェクト一覧取得
ClassMethod GetProjects() As %Status
{
    set projectNo = ..CallGetQueryOrDefault("projectNo")
    do ##class(Backend.src.Service.Master.ProjectService).GetProjects(projectNo)
    return $$$OK
}

/// プロジェクト新規作成
ClassMethod CreateProject() As %Status
{
    set requestObj = ..CallToRequestDynamicObject()
    do ##class(Backend.src.Service.Master.ProjectService).CreateProject(requestObj)
    return $$$OK
}

/// プロジェクト更新
ClassMethod UpdateProject() As %Status
{
    set requestObj = ..CallToRequestDynamicObject()
    do ##class(Backend.src.Service.Master.ProjectService).UpdateProject(requestObj)
    return $$$OK
}

}
