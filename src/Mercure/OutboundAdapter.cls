Class Mercure.OutboundAdapter Extends Ens.OutboundAdapter
{

Property Server As %String(MAXLEN = 1000) [ Required ];

Property Port As %Integer(MAXVAL = 65535, MINVAL = 0);

Property Path As %String(MAXLEN = "") [ Required ];

Property SSLConfig As %String;

Property Token As %String(MAXLEN = "") [ Required ];

Property Mercure As Mercure.Mercure;

Parameter SETTINGS = "Server:Mercure,Port:Mercure,Path:Mercure,SSLConfig:Mercure:sslConfigSelector,Token:Mercure";

Method OnInit() As %Status
{
    if (..Server = "") {
        return $$$ERROR(5001, "Server required")
    }
    if (..Token = "") {
        return $$$ERROR(5001, "Token required")
    }
    $$$EnsCheckSSLConfig(..SSLConfig)
    try {
        set ..Mercure = ##class(Mercure.Mercure).%New(..Server, ..Port, ..Path, ..SSLConfig, ..Token)
    } catch ex {
        return ex.AsStatus()
    }
    return $$$OK
}

Method Publish(topics As %List, data As %String) [ CodeMode = expression ]
{
..Mercure.Publish(topics, data)
}

}
