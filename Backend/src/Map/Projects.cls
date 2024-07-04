Include Backend.src.Const.Sys

Class Backend.src.Map.Projects Extends %CSP.REST
{

XData UrlMap
{
<Routes>
    <!-- プロジェクト一覧取得 -->
    <Route Url="/projects" Method="GET" Call="GetProjects"/>
    <!-- プロジェクト作成 -->
    <Route Url="/projects" Method="POST" Call="CreateProject"/>
    </Routes>
}

/// プロジェクト一覧取得
ClassMethod GetProjects() As %Status
{
    do GetProjects^Backend.src.Logic.Master.Project()
    return $$$OK
}

/// プロジェクト新規作成
ClassMethod CreateProject() As %Status
{
    do CreateProject^Backend.src.Logic.Master.Project()
    return $$$OK
}

}
