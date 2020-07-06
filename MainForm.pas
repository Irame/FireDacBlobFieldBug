unit MainForm;

interface

uses
  WinApi.Messages,
  WinApi.Windows,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.StdCtrls;

type
  TMainFrom = class(TForm)
    GridPanel1: TGridPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDConnection1: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure FDQuery2CalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  MainFrom: TMainFrom;

implementation

{$R *.dfm}

procedure TMainFrom.FDQuery2CalcFields(DataSet: TDataSet);
begin
  // a blob or memo field must be read to trigger the error
  DataSet.FieldByName('Memo').AsString;
end;

procedure TMainFrom.FormCreate(Sender: TObject);
begin
  try
    FDConnection1.Connected := true;
  except
    MessageDlg('Connection error, please check the connection configuration.', mtError, [mbOk], 0);
    Application.Terminate;
  end;

  FDQuery1.FetchOptions.Items := [fiMeta, fiDetails];
  FDQuery1.Open;

  FDQuery2.FieldDefs.Update;
  for var Loop := 0 to FDQuery2.FieldDefs.Count-1 do begin
    FDQuery2.FieldDefs[Loop].CreateField(FDQuery2).DataSet := FDQuery2;
  end;

  // A (internal) calc field must be preset to trigger the error
  with TIntegerField.Create(FDQuery2) do begin
    FieldName := 'CalcField';
    FieldKind := fkCalculated;
    Size := 0;
    DataSet := FDQuery2;
  end;

  // fiBlobs must be missing to trigger the error
  FDQuery2.FetchOptions.Items := [fiMeta, fiDetails];
  FDQuery2.Open;
end;

end.
