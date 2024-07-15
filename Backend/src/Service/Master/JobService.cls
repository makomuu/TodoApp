/// ------------------------------------------------------------------------
/// タスクサービスクラス
/// ------------------------------------------------------------------------
Class Backend.src.Service.Master.JobService Extends Backend.src.Base.ServiceBase
{

/// タスク取得処理
ClassMethod GetJobs(projectNo As %Integer)
{
    set jb = ##class(Backend.src.Utility.JsonBuilder).%New()
    set glJob = $$$Job
    set key=  ""

    for {
        set key = $O(@glJob@(key), 1) quit:(key = "")
        continue:(projectNo '= "")&&(projectNo '= key)

        set entity = ##class(Entity.Master.Job).%New()
        do entity.SetByGlobal(key)

        set jobJSON = entity.CreateJson()
        do jb.PushResult(jobJSON)
    }
    do jb.WriteJSON()
}

/// タスク新規作成
ClassMethod CreateJob(jobObj As %DynamicObject, projectNo As %Integer)
{
    set job = ##class(Entity.Master.Job).%New()
    set job.ProjectNo = projectNo
    do job.SetByJson(jobObj)

    do job.Register()

    #; Json作成
    do job.CreateResponseJSON()
}

/// タスク更新
ClassMethod UpdateJob(jobObj As %DynamicObject, projectNo As %Integer)
{
    set job = ##class(Entity.Master.Job).%New()
    set job.ProjectNo = projectNo
    do job.SetByJson(jobObj)

    do job.Register()

    #; Json作成
    do job.CreateResponseJSON()
}

/// タスク削除
ClassMethod DeleteJob(projectNo As %Integer, ticketNo As %Integer)
{
    set job = ##class(Entity.Master.Job).%New()
    do job.SetByGlobal(projectNo, ticketNo)

    do job.Delete()
    #; Json作成
    do job.CreateResponseJSON()
}

}
