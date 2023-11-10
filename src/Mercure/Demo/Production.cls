Class Mercure.Demo.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Mercure.DemoProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Mercure.Demo.Operation" Category="" ClassName="Mercure.Demo.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Path"></Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Adapter" Name="Server"></Setting>
    <Setting Target="Adapter" Name="Token"></Setting>
  </Item>
</Production>
}

}
