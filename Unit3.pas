unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, System.Messaging, Unit2;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure sub;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

var
  SubscriptionId: Integer;

var
  MsgListener: TMessageListener;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  Message: TMessage;
begin

  ttx.bb := Edit1.Text;
  ttx.i := 90;
  Message := TMessage<tx>.Create(ttx);
  message_bus.SendMessage(nil, Message, True);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  message_bus.Unsubscribe(TMessage<tx>, SubscriptionId, true);
end;
 procedure TForm3.sub;
 begin
     MsgListener :=
    procedure(const Sender: TObject; const M: TMessage)
    begin
      memo1.Lines.Add((M as TMessage<tx>).Value.bb);      //  MessageBus.Unsubscribe(TTextMessage, fFirstSubscriberID);
    end;
 end;
procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 message_bus.Unsubscribe(TMessage<tx>, SubscriptionId, true);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
           sub();
  SubscriptionId := message_bus.SubscribeToMessage(TMessage<tx>, MsgListener);

end;

end.

