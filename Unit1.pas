unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Messaging, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Defaults,
  System.Generics.Collections;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  xx: TPair<string, integer>;

implementation

{$R *.dfm}

uses
  Unit3, unit2;

procedure TForm1.Button1Click(Sender: TObject);
var
  Message: TMessage;
begin

  ttx.bb := Edit1.Text;
  ttx.i := 90;
  Message := TMessage<tx>.Create(ttx);
  message_bus.SendMessage(nil, Message, true);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not Assigned(Form3) then
    Form3 := TForm3.create(nil);
  Form3.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form3.Close;
  FreeAndNil(Form3);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  SubscriptionId: Integer;
begin

  SubscriptionId := message_bus.SubscribeToMessage(TMessage<tx>,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      memo1.Lines.Add((M as TMessage<tx>).Value.bb);
    end);
end;

end.

