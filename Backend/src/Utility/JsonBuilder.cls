Class Backend.src.Utility.JsonBuilder
{

/// メッセージ
Property Message As %String;

/// リザルト部
Property Result As %DynamicArray [ InitialExpression = {##class(%DynamicObject).%New()} ];

/// 返却JSON
Property Body As %DynamicObject [ InitialExpression = {##class(%DynamicObject).%New()} ];

Method %New()
{
    return $$$OK
}

/// リザルト追加
Method PushResult(json As %DynamicObject)
{
    do:(json '= "") ..Result.%Push(json)
}

Method WriteJSON() As %Status
{
    write "{ ""message"": """_ ..Message _ """,""result"": ["

    set iter = ..Result.%GetIterator()
    set canMoveNext = iter.%GetNext(.key, .value)

    While canMoveNext {
        write value.%ToJSON()
        set canMoveNext = iter.%GetNext(.key, .value)
        if (canMoveNext) {
            write ","
        }
    }
    write "]}"
    return $$$OK
}

}
