unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Generics.Defaults, System.Generics.Collections, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  txx = record
    say: string;
    tm: TDateTime;
    content: string;
  end;

var
  Form1: TForm1;
         //System.Generics.Collections,
  auto_free: TObjectDictionary<string, TList<txx>>;

// im �Ի����ݴ洢 ��ʾ
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  auto_free.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  vv: TList<txx>;
begin
  auto_free := TObjectDictionary<string, TList<txx>>.Create([doOwnsValues]);
  var t_list := TList<txx>.Create;
  var x: txx;
  x.say := '����';
  x.tm := 0;
  x.content := 'ɶʱ��ȥԼС����';
  t_list.Add(x);
  auto_free.Add('10001', t_list);

  if auto_free.TryGetValue('10001', vv) then
  begin
    var b: txx;
    b.say := 'me';
    b.tm := 0;
    b.content := 'С���ּ����';
    vv.Add(b);
  end;
  auto_free.Add('10008', TList<txx>.Create);
  if auto_free.TryGetValue('10008', vv) then
  begin

    var b: txx;
    b.say := 'me';
    b.tm := 0;
    b.content := '����������������';
    vv.Add(b);
  end;

  for var p in auto_free.Items['10008'] do
  begin
    Memo1.Lines.Add(p.say + ': ' + p.content)
  end;

  for var p in auto_free.Items['10001'] do
  begin
    Memo1.Lines.Add(p.say + ': ' + p.content)
  end;

end;

end.

