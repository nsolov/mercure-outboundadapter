Class Mercure.Demo.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "Mercure.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method SampleCall(pRequest As Ens.StringContainer, Output pResponse As Ens.Response) As %Status
{
    Return ..Adapter.Publish($LB("https://aaa.com/a2"), pRequest.StringValue)
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.StringContainer">
    <Method>SampleCall</Method>
  </MapItem>
</MapItems>
}

}
