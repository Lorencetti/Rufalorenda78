unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.Touch.GestureMgr;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    RgSexo: TRadioGroup;
    Panel1: TPanel;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Panel4: TPanel;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    Panel5: TPanel;
    Label5: TLabel;
    EditNome: TEdit;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    ScrollBar1: TScrollBar;
    Panel7: TPanel;
    Label8: TLabel;
    Edit1: TEdit;
    Panel8: TPanel;
    Label9: TLabel;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    StringGrid1: TStringGrid;
    Panel9: TPanel;
    Editar: TBitBtn;
    BitBtn1: TBitBtn;
    BitExcluir: TBitBtn;
    BtFiltrar: TBitBtn;
    BtnFiltrar: TBitBtn;
    BTRemoveFiltro: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure BtFiltrarClick(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure BTRemoveFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 Type
    Contato = record

    Nome : string[40];
    Idade: integer;
    Sexo : boolean;
    TelefoneComercial : string[13];
    TelefoneResidencial : string[14];
    Endereço : string[40];
    Bairro   : string[20];
    EstadoCivil: string[1];
    CEP: string[9];
    Status: boolean;
   end;

var
  Form1: TForm1;
  Agenda : array [1..100] of contato;
  Filtro : contato;
  Arquivo : file of contato;

implementation

{$R *.dfm}


procedure TForm1.BtExcluirClick(Sender: TObject);
var i,l,c,x : integer;
begin
      //  ShowMessage(StringGrid1.Cells[StringGrid1.Col,StringGrid1.row]);
      // ShowMEssage(StringGrid1.Row.ToString);

      //  muda o .status na posição selecionada a partir do nome
        i:= 1;
        While i <= 100 do
      begin
        if (Agenda[i].Nome = StringGrid1.Cells[0,StringGrid1.row])  then
        begin
           Agenda[stringGrid1.row].status := false;
        end;
        i := i + 1;
      end;

      //limpa o string grid
       for c := 0 to StringGrid1.colCount - 1 do
      begin
          for l := 1 to StringGrid1.rowCount - 1 do
         begin
           StringGrid1.cells[c,l] := '';
         end;
      end;

      //escreve as informaçoes no string grid (atualiza)

 x := 1;
 i := 1;
 While i <= 100 do
  begin
  if Agenda[i].Status then
  begin
  StringGrid1.Cells[0,x] := Agenda[i].Nome;
  if Agenda[x].Sexo then
  StringGrid1.Cells[1,x] := 'Masculino'
  else
  StringGrid1.Cells[1,x] := 'Masculino';
  StringGrid1.Cells[2,x] := IntToStr(Agenda[i].Idade);
  StringGrid1.Cells[3,x] := Agenda[i].TelefoneComercial;
  StringGrid1.Cells[4,x] := Agenda[i].TelefoneResidencial;
  StringGrid1.Cells[5,x] := Agenda[i].Endereço;
  StringGrid1.Cells[6,x] := Agenda[i].Bairro;
  if Agenda[i].EstadoCivil = 'S'  then
   StringGrid1.Cells[7,x] := 'Solteiro'
  else if Agenda[i].EstadoCivil = 'C' then
    StringGrid1.Cells[7,x] := 'Casado'
  else if Agenda[i].EstadoCivil = 'V' then
    StringGrid1.Cells[7,x] := 'Viúvo'
  else if Agenda[i].EstadoCivil = 'D' then
  StringGrid1.Cells[7,x] := 'Divorciado';
  StringGrid1.Cells[8,x] := Agenda[i].CEP;
  x := x + 1;
  end;

  i := i + 1;
  end;
  StringGrid1.RowCount := x;
  StringGrid1.ColCount := 9;

end;

procedure TForm1.BtFiltrarClick(Sender: TObject);
begin
  TabSheet1.Show;
  MessageDlg('Digite nos campos que deseja filtrar, deixando os outros em branco',mtInformation,[mbOK],0);
  BtnFiltrar.Enabled := true;
end;

procedure TForm1.BtnFiltrarClick(Sender: TObject);
var c,l,i,x,Sexo : integer;
    Aborto       : boolean;
begin

    //nome é critério
    if EditNome.Text <> '' then
       Filtro.Nome := UPPERCASE(editNome.Text)
    else filtro.nome := '';
    //idade é critério
       Filtro.Idade := scrollBar1.Position;
    //CEP é critério
    if MaskEdit1.Text <> '     -   ' then
       Filtro.cep := MaskEdit1.Text
    else filtro.cep := '';
    //tel comercial é critério
    if MaskEdit2.Text <> '(  )     -    ' then
       filtro.TelefoneComercial := MaskEdit2.Text
    else filtro.TelefoneComercial := '';
    //tel residencial é critério
    if MaskEdit3.Text <> '( )    -    ' then
       Filtro.TelefoneResidencial := MaskEdit3.Text
       else filtro.TelefoneResidencial := '';
    //EstadoCivil é critério
            if ComboBox1.ItemIndex = 0 then
          Filtro.EstadoCivil := 'S'
          else if ComboBox1.ItemIndex = 1 then
          Filtro.EstadoCivil := 'C'
          else if ComboBox1.ItemIndex = 2 then
          Filtro.EstadoCivil := 'D'
          else if ComboBox1.ItemIndex = 3 then
          Filtro.EstadoCivil := 'V'
          else Filtro.EstadoCivil := 'F';
    //Bairro é critério
    if Edit2.Text <> '' then
       Filtro.Bairro :=  Edit2.Text
       else Filtro.Bairro := '';
    //Endereço é critério
    if Edit1.Text <> '' then
       Filtro.Endereço := Edit1.Text
       else Filtro.Endereço := '';
    //Sexo é critério
           Sexo := 0;

          if (rgSexo.ItemIndex = 0) then
          Filtro.Sexo := True
          Else if(rgSexo.ItemIndex = 1) then
          Filtro.Sexo := False
          Else if RgSexo.ItemIndex = -1 then
          Sexo := 1;
      //Se sexo for 1 é pq ele ñ é criterio para filtrar!!!

      //vai para a outra tela
  Tabsheet2.Show;


            //limpa o string grid
       for c := 0 to StringGrid1.colCount - 1 do
      begin
          for l := 1 to StringGrid1.rowCount - 1 do
         begin
           StringGrid1.cells[c,l] := '';
         end;
      end;

      //escreve as informaçoes no string grid (atualiza)
 x := 1;
 i := 1;
 While i <= 100 do
  begin
    if (Agenda[i].Status) then
    begin
      Aborto := false;
      //Filtrar Nome
        if Filtro.Nome <> '' then
      begin
        if agenda[i].Nome <> Filtro.Nome then
          Aborto := true;
      end;

    // Filtrar Sexo
    if sexo = 0 then
      begin
       if Agenda[i].Sexo <> filtro.Sexo then
          aborto := true
      end;

     //Filtrar Idade
     if filtro.Idade <> 0 then
      begin
        if Agenda[i].Idade <> filtro.Idade then
          Aborto := true;
      end;

     //Filtrar Telefone Comercial
     if filtro.TelefoneComercial <> '' then
      begin
        if Agenda[i].TelefoneComercial <> filtro.TelefoneComercial then
         Aborto := true;
      end;

     //Filtrar Telefone Residencial
     if filtro.TelefoneResidencial <> '' then
      begin
        if Agenda[i].TelefoneResidencial <> filtro.TelefoneResidencial then
         Aborto := true;
      end;

      //Filtrar Estado Civil
      if filtro.EstadoCivil <> 'F' then
      begin
        if Agenda[i].EstadoCivil <> filtro.EstadoCivil then
        Aborto := true;
      end;

      //Filtrar Endereço
      if filtro.Endereço <> '' then
      begin
        if Agenda[i].Endereço <> filtro.Endereço then
        Aborto := true;
      end;
    end;

      //Filtrar CEP
      if filtro.CEP <> '' then
      begin
        if Agenda[i].Endereço <> filtro.Endereço then
        Aborto := true;
      end;

      //Filtrar Bairro
      if filtro.Bairro <> '' then
      begin
        if Agenda[i].Bairro <> filtro.Bairro then
        Aborto := true;
      end;

     //Se não houve aborto, escrever o Agenda[i] no String Grid

     if ((Aborto = false) AND (Agenda[i].Status)) then
     begin
       StringGrid1.Cells[0,x] := Agenda[i].Nome;
        if Agenda[i].Sexo then
        StringGrid1.Cells[1,x] := 'Masculino'
       else
     StringGrid1.Cells[1,x] := 'Feminino';
     StringGrid1.Cells[2,x] := IntToStr(Agenda[i].Idade);
     StringGrid1.Cells[3,x] := Agenda[i].TelefoneComercial;
     StringGrid1.Cells[4,x] := Agenda[i].TelefoneResidencial;
     StringGrid1.Cells[5,x] := Agenda[i].Endereço;
     StringGrid1.Cells[6,x] := Agenda[i].Bairro;
     if Agenda[i].EstadoCivil = 'S'  then
      StringGrid1.Cells[7,x] := 'Solteiro'
     else if Agenda[i].EstadoCivil = 'C' then
       StringGrid1.Cells[7,x] := 'Casado'
      else if Agenda[i].EstadoCivil = 'V' then
        StringGrid1.Cells[7,x] := 'Viúvo'
      else if Agenda[i].EstadoCivil = 'D' then
     StringGrid1.Cells[7,x] := 'Divorciado';
     StringGrid1.Cells[8,x] := Agenda[i].CEP;
     x := x + 1;

     end;

  i := i + 1;
    end;

  //coloca o string grid do tamanho certo
  StringGrid1.RowCount := x;
  StringGrid1.ColCount := 9;
  //abilita e desabilita botãousn
    BtnFiltrar.Enabled := false;
    BtRemoveFiltro.Enabled := true;
end;

procedure TForm1.BTRemoveFiltroClick(Sender: TObject);
var c,x,i,l : integer;
begin

           //limpa o string grid
       for c := 0 to StringGrid1.colCount - 1 do
      begin
          for l := 1 to StringGrid1.rowCount - 1 do
         begin
           StringGrid1.cells[c,l] := '';
         end;
      end;



      //escreve as informaçoes no string grid (atualiza)
 x := 1;
 i := 1;
 While i <= 100 do
  begin
  if Agenda[i].Status then
  begin
  StringGrid1.Cells[0,x] := Agenda[i].Nome;
  if Agenda[i].Sexo then
  StringGrid1.Cells[1,x] := 'Masculino'
  else
  StringGrid1.Cells[1,x] := 'Feminino';
  StringGrid1.Cells[2,x] := IntToStr(Agenda[i].Idade);
  StringGrid1.Cells[3,x] := Agenda[i].TelefoneComercial;
  StringGrid1.Cells[4,x] := Agenda[i].TelefoneResidencial;
  StringGrid1.Cells[5,x] := Agenda[i].Endereço;
  StringGrid1.Cells[6,x] := Agenda[i].Bairro;
  if Agenda[i].EstadoCivil = 'S'  then
   StringGrid1.Cells[7,x] := 'Solteiro'
  else if Agenda[i].EstadoCivil = 'C' then
    StringGrid1.Cells[7,x] := 'Casado'
  else if Agenda[i].EstadoCivil = 'V' then
    StringGrid1.Cells[7,x] := 'Viúvo'
  else if Agenda[i].EstadoCivil = 'D' then
  StringGrid1.Cells[7,x] := 'Divorciado';
  StringGrid1.Cells[8,x] := Agenda[i].CEP;
  x := x + 1;
  end;

  i := i + 1;
  end;
  StringGrid1.RowCount := x;
  StringGrid1.ColCount := 9;

  //Limpa os campos preenchidos
          EditNome.Text := '';
          Edit1.Text    := '';
          Edit2.Text    := '';
          MaskEdit1.Text:= '';
          MaskEdit2.Text:= '';
          MaskEdit3.Text:= '';
          ScrollBar1.Position := 0;
          ComboBox1.ItemIndex := -1;
          rgSexo.ItemIndex :=  -1;

  BTRemoveFiltro.Enabled := false;

end;

procedure TForm1.Button1Click(Sender: TObject);
var i,x : integer;
begin

     i := 1;
    While i <= 100 do
      begin
        if (Agenda[i].Status = false)  then
        begin

          //Teste para ver se o nome já foi cadastrado anteriormente
          x := 1;
          While x <= 100 do
          begin
           if ((Agenda[x].Status = true) AND (Agenda[x].Nome = UPPERCASE(EditNome.Text)))  then
           begin
            MessageDlg('Este nome já está gravado no sistema!',mtError,[mbRetry],0);
            EditNome.Setfocus;
            Exit;
           end;

           x := x + 1;
          end;

           //Cadastro Nome
          if ((EditNome.Text <> '') AND(Length(EditNome.text) <= 40) AND(Length(EditNome.text) > 1))then
          Agenda[i].Nome := UPPERCASE(EditNome.Text)
          else
          begin
            MessageDlg('Digite seu nome novamente!',mtError,[mbRetry],0);
            EditNome.Setfocus;
            Exit
          end;


          //Cadastro Sexo
          if (rgSexo.ItemIndex = 0) then
          Agenda[i].Sexo := True
          Else if(rgSexo.ItemIndex = 1) then
          Agenda[i].Sexo := False
          Else
          begin
            MessageDlg('Selecione um Sexo!',mtError,[mbRetry],0);
            Exit
          end;


          //Cadastro Estado Civil
          if ComboBox1.ItemIndex = 0 then
          Agenda[i].EstadoCivil := 'S'
          else if ComboBox1.ItemIndex = 1 then
          Agenda[i].EstadoCivil := 'C'
          else if ComboBox1.ItemIndex = 2 then
          Agenda[i].EstadoCivil := 'D'
          else if ComboBox1.ItemIndex = 3 then
          Agenda[i].EstadoCivil := 'V'
          else
          begin
            MessageDlg('Selecione um Estado Civil!',mtError,[mbRetry],0);
            ComboBox1.SetFocus;
            Exit
          end;

          //Cadastro CEP
         if ((MaskEdit1.Text <> ''))then
         Agenda[i].CEP := MaskEdit1.Text
         else
         begin
            MessageDlg('CEP incorreto ou inexistente!',mtError,[mbRetry],0);
            MaskEdit1.SetFocus;
            Exit
         end;

          //Cadastro Telefone Residencial
          if ((Maskedit2.text <> '')) then
          Agenda[i].TelefoneResidencial := Maskedit2.text
          else
          begin
            MessageDlg('Digite seu telefone Residencial!',mtError,[mbRetry],0);
            MaskEdit2.SetFocus;
            Exit
          end;

          //Cadastro Telefone Comercial
          if ((Maskedit3.text <> '')) then
          Agenda[i].TelefoneComercial := Maskedit3.text
          else
          begin
            MessageDlg('Digite seu telefone Comercial!',mtError,[mbRetry],0);
            MaskEdit3.SetFocus;
            Exit
          end;

          //Cadastro Idade
          Agenda[i].Idade := ScrollBar1.Position;

            //Cadastro Endereço
            if ((Edit1.Text <> '') AND (Length(Edit1.Text) <= 40) AND (Length(Edit1.Text) > 3))then
                Agenda[i].Endereço := Edit1.Text
            else
             begin
                  MessageDlg('Digite o seu Endereço novamente!',mtError,[mbRetry],0);
                  Edit1.SetFocus;
                  Exit
              end;

          //Cadastro Bairro
            if ((Edit2.Text <> '') AND (Length(Edit2.Text) <= 40)AND (Length(Edit2.Text) > 3))then
                Agenda[i].Bairro := Edit2.Text
            else
             begin
                  MessageDlg('Digite o seu bairro novamente!',mtError,[mbRetry],0);
                  Edit2.SetFocus;
                  Exit
              end;

          //Mudar o status para true.
          Agenda[i].Status := true;

          //Limpa os campos preenchidos
          EditNome.Text := '';
          Edit1.Text    := '';
          Edit2.Text    := '';
          MaskEdit1.Text:= '';
          MaskEdit2.Text:= '';
          MaskEdit3.Text:= '';
          ScrollBar1.Position := 10;
          ComboBox1.ItemIndex := 0;
          rgSexo.ItemIndex := -1;

          //Gera mensagem para avisar  que o cadastro foi completo
          MessageDlg('Seu cadastro foi completado com exito!',mtConfirmation,[mbOK],0);
          //mostra o contato
           TabSheet2.Show;
          //Sair do Laço
          exit
          end;

        //incrementa o laço
        i := i + 1;
    end;
    TabSheet2.Show;
end;


procedure TForm1.EditarClick(Sender: TObject);
var i,x,c,l,S : integer;
begin
     //  muda o .status na posição selecionada a partir do nome
        i:= 1;
        s:= 0;
        While i <= 100 do
      begin
        if (Agenda[i].Nome = StringGrid1.Cells[0,StringGrid1.row])  then
        begin
            //util para saber se algo foi editado
            s := 0;
            //carrega bairro
             Edit2.Text := Agenda[i].Bairro;
            //carrega endereço
            Edit1.Text := Agenda[i].Endereço;
            //Carrega Idade
            ScrollBar1.Position := Agenda[i].Idade;
            //carrega tel comercial
            Maskedit3.text := Agenda[i].TelefoneComercial;
            //Carrega Telefone Residencial
            Maskedit2.text := Agenda[i].TelefoneResidencial;
            //Carrega CEP
            MaskEdit1.Text := Agenda[i].CEP;
            //Carrega Estado Civil
            if Agenda[i].EstadoCivil = 'S' then
            ComboBox1.ItemIndex := 0
             else if Agenda[i].EstadoCivil = 'C' then
             ComboBox1.ItemIndex := 1
            else if  Agenda[i].EstadoCivil = 'D' then
             ComboBox1.ItemIndex := 2
            else if Agenda[i].EstadoCivil = 'V' then
            ComboBox1.ItemIndex := 3;
           //Carrega Sexo
          if Agenda[i].Sexo = True then
          rgSexo.ItemIndex := 0
          else
          rgSexo.ItemIndex := 1;
          //carrega Nome
          EditNome.Text := Agenda[i].Nome;
          //muda o .status para que ele seja salvo novamente
          Agenda[i].Status := false;
        end;

        i := i + 1;
      end;
        //manda o usuário ir até a tela de cadastro, e o informa que algo deu errado caso isso ocorra.
       if s = 0 then
       MessageDlg('Seu contato foi carregado com sucesso, vá para a tela de cadastro para modifica-lo',mtConfirmation,[mbOK],0)
       else
       MessageDlg('Selecione um contato para edita-lo.',mtError,[mbRetry],0);

           //limpa o string grid
       for c := 0 to StringGrid1.colCount - 1 do
      begin
          for l := 1 to StringGrid1.rowCount - 1 do
         begin
           StringGrid1.cells[c,l] := '';
         end;
      end;



      //escreve as informaçoes no string grid (atualiza)
 x := 1;
 i := 1;
 While i <= 100 do
  begin
  if Agenda[i].Status then
  begin
  StringGrid1.Cells[0,x] := Agenda[i].Nome;
  if Agenda[i].Sexo then
  StringGrid1.Cells[1,x] := 'Masculino'
  else
  StringGrid1.Cells[1,x] := 'Feminino';
  StringGrid1.Cells[2,x] := IntToStr(Agenda[i].Idade);
  StringGrid1.Cells[3,x] := Agenda[i].TelefoneComercial;
  StringGrid1.Cells[4,x] := Agenda[i].TelefoneResidencial;
  StringGrid1.Cells[5,x] := Agenda[i].Endereço;
  StringGrid1.Cells[6,x] := Agenda[i].Bairro;
  if Agenda[i].EstadoCivil = 'S'  then
   StringGrid1.Cells[7,x] := 'Solteiro'
  else if Agenda[i].EstadoCivil = 'C' then
    StringGrid1.Cells[7,x] := 'Casado'
  else if Agenda[i].EstadoCivil = 'V' then
    StringGrid1.Cells[7,x] := 'Viúvo'
  else if Agenda[i].EstadoCivil = 'D' then
  StringGrid1.Cells[7,x] := 'Divorciado';
  StringGrid1.Cells[8,x] := Agenda[i].CEP;
  x := x + 1;
  end;

  i := i + 1;
  end;
  StringGrid1.RowCount := x;
  StringGrid1.ColCount := 9;

 TabSheet1.Show;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var i : integer;
begin
// Realizando a escrita de um arquivo

		REWRITE(ARQUIVO);
		i := 1;
		WHILE i <= 100 DO
		BEGIN

			IF ( Agenda[i].Status = TRUE) THEN
			BEGIN
				WRITE(ARQUIVO, Agenda[i]);
			END;
      i := i + 1;
		END;

  CLOSEFILE(ARQUIVO);
end;


procedure TForm1.FormCreate(Sender: TObject);
var i : integer;
begin
  BTRemoveFiltro.Enabled := false;

  AssignFile(Arquivo, 'AGENDA.TXT');

   IF FILEEXISTS('AGENDA.TXT') then
        RESET(arquivo)
   ELSE
      REWRITE(arquivo);


  // posiciona o ponteiro de registros no início do arquivo
  SEEK(ARQUIVO,0);
		i := 1;
		WHILE (NOT EOF(ARQUIVO)) DO
		BEGIN

			READ(ARQUIVO,Agenda[i]);
			i := i + 1;

		END;
end;



procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Label7.Caption := ScrollBar1.Position.ToString + ' Anos.';
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
var i,l,c : integer;
begin
   i := 1;
   c := 1;
 While i <= 100 do
  begin
     if Agenda[i].Status then
      begin
         inc(c);
      end;
      i := i + 1;
  end;
  StringGrid1.RowCount := c;
  StringGrid1.ColCount := 9;
  //16 carateres é 100 pixels
  StringGrid1.ColWidths[0] := 300;
  i := 0;
  StringGrid1.Cells[0,i] := 'Nome';
  StringGrid1.Cells[1,i] := 'Sexo';
  StringGrid1.Cells[2,i] := 'Idade';
  StringGrid1.Cells[3,i] := 'Telefone Comercial';
  StringGrid1.Cells[4,i] := 'Telefone Residencial';
  StringGrid1.Cells[5,i] := 'Endereço';
  StringGrid1.Cells[6,i] := 'Bairro';
  StringGrid1.Cells[7,i] := 'Estado Civil';
  StringGrid1.Cells[8,i] := 'CEP';


 //escrever as informaçoes no string grid
 i := 1;
 While i <= 100 do
  begin
  if Agenda[i].Status then
  begin
  StringGrid1.Cells[0,i] := Agenda[i].Nome;
  if Agenda[i].Sexo then
  StringGrid1.Cells[1,i] := 'Masculino'
  else
  StringGrid1.Cells[1,i] := 'Feminino';
  StringGrid1.Cells[2,i] := IntToStr(Agenda[i].Idade);
  StringGrid1.Cells[3,i] := Agenda[i].TelefoneComercial;
  StringGrid1.Cells[4,i] := Agenda[i].TelefoneResidencial;
  StringGrid1.Cells[5,i] := Agenda[i].Endereço;
  StringGrid1.Cells[6,i] := Agenda[i].Bairro;
  if Agenda[i].EstadoCivil = 'S'  then
   StringGrid1.Cells[7,i] := 'Solteiro'
  else if Agenda[i].EstadoCivil = 'C' then
    StringGrid1.Cells[7,i] := 'Casado'
  else if Agenda[i].EstadoCivil = 'V' then
    StringGrid1.Cells[7,i] := 'Viúvo'
  else if Agenda[i].EstadoCivil = 'D' then
  StringGrid1.Cells[7,i] := 'Divorciado';
  StringGrid1.Cells[8,i] := Agenda[i].CEP;
  end;

  i := i + 1;
  end;

end;

end.
