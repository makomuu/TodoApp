/// ------------------------------------------------------------------------
/// プロジェクトサービスクラス
/// ------------------------------------------------------------------------
Class Backend.src.Service.Master.ProjectService Extends Backend.src.Base.ServiceBase
{

ClassMethod GetProjects(projectNo As %Integer)
{
}

/// プロジェクト新規作成
ClassMethod CreateProject(projectObj As %DynamicObject)
{
    set project = ##class(Entity.Master.Project).%New()
    do project.SetByJson(projectObj)

    do project.Register()
}

/// プロジェクト更新
ClassMethod UpdateProject(projectObj As %DynamicObject)
{
    set project = ##class(Entity.Master.Project).%New()
    do project.SetByJson(projectObj)

    do project.Register()
}

}
