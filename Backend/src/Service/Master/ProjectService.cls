/// ------------------------------------------------------------------------
/// プロジェクトサービスクラス
/// ------------------------------------------------------------------------
Class Backend.src.Service.Master.ProjectService Extends Backend.src.Base.ServiceBase
{

/// プロジェクト取得処理
ClassMethod GetProjects(projectNo As %Integer)
{
    set jb = ##class(Backend.src.Utility.JsonBuilder).%New()
    set glProject = $$$Project
    set key=  ""

    for {
        set key = $O(@glProject@(key), 1) quit:(key = "")
        continue:(projectNo '= "")&&(projectNo '= key)

        set entity = ##class(Entity.Master.Project).%New()
        do entity.SetByGlobal(key)

        set projectJSON = entity.CreateJson()
        do jb.PushResult(projectJSON)
    }
    do jb.WriteJSON()
}

/// プロジェクト新規作成
ClassMethod CreateProject(projectObj As %DynamicObject)
{
    set project = ##class(Entity.Master.Project).%New()
    do project.SetByJson(projectObj)

    do project.Register()

    #; Json作成
    do project.CreateResponseJSON()
}

/// プロジェクト更新
ClassMethod UpdateProject(projectObj As %DynamicObject)
{
    set project = ##class(Entity.Master.Project).%New()
    do project.SetByJson(projectObj)

    do project.Register()
        #; Json作成
    do project.CreateResponseJSON()
}

}
