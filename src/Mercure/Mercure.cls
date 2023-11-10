Class Mercure.Mercure Extends %RegisteredObject
{

Property HttpRequest As %Net.HttpRequest;

Method %OnNew(server, port, path, sslConfig = "", token) As %Status
{
    try {
        set ..HttpRequest = ##class(%Net.HttpRequest).%New()
        set ..HttpRequest.Server = server
        set ..HttpRequest.Port = port
        set ..HttpRequest.Location = path
        if (sslConfig '= "") {
            set ..HttpRequest.SSLConfiguration = sslConfig
        }
        do ..HttpRequest.SetHeader("Authorization", "Bearer " _ token)
        do ..HttpRequest.SetHeader("Content-Type", "application/x-www-form-urlencoded")
    } catch ex {
        throw ex
    }
    return $$$OK
}

Method Publish(topics As %List, data As %String) As %String
{
    set httprequest = ..HttpRequest.%ConstructClone()
    for i=1:1:$listlength(topics) {
        do httprequest.InsertFormData("topic", $listget(topics,i))
    }
    do httprequest.InsertFormData("data", data)
    return httprequest.Post()
}

}
