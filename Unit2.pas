unit Unit2;

interface

uses
  System.Messaging;

type
  tx=record
   bb:string;
   i:Integer;
 end;
var
 ttx:tx;
var
  message_bus: TMessageManager;

implementation
 initialization
      message_bus := TMessageManager.DefaultManager;
end.

