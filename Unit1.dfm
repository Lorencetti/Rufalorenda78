object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Rufalerenda 78'
  ClientHeight = 522
  ClientWidth = 1016
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1016
    Height = 522
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Panel2: TPanel
        Left = 363
        Top = 143
        Width = 174
        Height = 138
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 8
          Width = 130
          Height = 13
          Caption = 'Selecione o seu estado civil'
        end
        object ComboBox1: TComboBox
          Left = 16
          Top = 41
          Width = 145
          Height = 21
          AutoCloseUp = True
          Style = csDropDownList
          TabOrder = 0
          Items.Strings = (
            'Solteiro'
            'Casado'
            'Divorciado'
            'Vi'#250'vo')
        end
      end
      object Panel3: TPanel
        Left = 363
        Top = 3
        Width = 174
        Height = 134
        TabOrder = 1
        object Label1: TLabel
          Left = 48
          Top = 8
          Width = 69
          Height = 13
          Caption = 'Digite seu CEP'
        end
        object MaskEdit1: TMaskEdit
          Left = 16
          Top = 41
          Width = 117
          Height = 21
          EditMask = '00000\-000;1;_'
          MaxLength = 9
          TabOrder = 0
          Text = '     -   '
        end
      end
      object RgSexo: TRadioGroup
        Left = 720
        Top = 0
        Width = 142
        Height = 121
        Caption = 'Selecione Seu sexo'
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 3
        Top = 143
        Width = 174
        Height = 138
        TabOrder = 3
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 146
          Height = 13
          Caption = 'Digite seu telefone Residencial'
        end
        object MaskEdit2: TMaskEdit
          Left = 24
          Top = 49
          Width = 114
          Height = 21
          EditMask = '!\(99\)00000-0000;0;_'
          MaxLength = 14
          TabOrder = 0
          Text = ''
        end
      end
      object Panel4: TPanel
        Left = 183
        Top = 143
        Width = 174
        Height = 138
        TabOrder = 4
        object Label4: TLabel
          Left = 16
          Top = 16
          Width = 139
          Height = 13
          Caption = 'Digite seu telefone Comercial'
        end
        object MaskEdit3: TMaskEdit
          Left = 24
          Top = 49
          Width = 110
          Height = 21
          EditMask = '!\(99\)0000-0000;0;_'
          MaxLength = 13
          TabOrder = 0
          Text = ''
        end
      end
      object Panel5: TPanel
        Left = 3
        Top = 3
        Width = 174
        Height = 134
        TabOrder = 5
        object Label5: TLabel
          Left = 24
          Top = 8
          Width = 76
          Height = 13
          Caption = 'Digite seu nome'
        end
        object EditNome: TEdit
          Left = 24
          Top = 41
          Width = 138
          Height = 21
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 183
        Top = 3
        Width = 174
        Height = 134
        TabOrder = 6
        object Label6: TLabel
          Left = 40
          Top = 8
          Width = 87
          Height = 13
          Caption = 'Informe sua idade'
        end
        object Label7: TLabel
          Left = 59
          Top = 91
          Width = 33
          Height = 13
          Caption = '0 Anos'
        end
        object ScrollBar1: TScrollBar
          Left = 21
          Top = 41
          Width = 121
          Height = 29
          Max = 150
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBar1Change
        end
      end
      object Panel7: TPanel
        Left = 543
        Top = 3
        Width = 174
        Height = 134
        TabOrder = 7
        object Label8: TLabel
          Left = 32
          Top = 8
          Width = 95
          Height = 13
          Caption = 'Digite seu Endere'#231'o'
        end
        object Edit1: TEdit
          Left = 24
          Top = 41
          Width = 121
          Height = 21
          TabOrder = 0
        end
      end
      object Panel8: TPanel
        Left = 543
        Top = 143
        Width = 174
        Height = 138
        TabOrder = 8
        object Label9: TLabel
          Left = 32
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Digite seu Bairro'
        end
        object Edit2: TEdit
          Left = 24
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 0
        end
      end
      object BitBtn1: TBitBtn
        Left = 782
        Top = 433
        Width = 142
        Height = 41
        Caption = '&Cadastrar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 9
        OnClick = Button1Click
      end
      object BtnFiltrar: TBitBtn
        Left = 639
        Top = 433
        Width = 137
        Height = 41
        Caption = 'Filtrar'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        TabOrder = 10
        OnClick = BtnFiltrarClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Agenda'
      ImageIndex = 1
      OnShow = TabSheet1Show
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 1008
        Height = 453
        Align = alClient
        ColCount = 9
        DefaultColWidth = 95
        DefaultRowHeight = 25
        FixedCols = 0
        RowCount = 9
        TabOrder = 0
        ColWidths = (
          202
          53
          40
          81
          125
          119
          79
          94
          132)
      end
      object Panel9: TPanel
        Left = 0
        Top = 453
        Width = 1008
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        TabOrder = 1
        object Editar: TBitBtn
          Left = 32
          Top = 4
          Width = 121
          Height = 25
          Hint = 'Previous|Go back to the previous tab'
          Caption = 'Editar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
            5555557777777775F5555559999999505555555777777757FFF5555555555550
            0955555555555FF7775F55555555995501955555555577557F75555555555555
            01995555555555557F5755555555555501905555555555557F57555555555555
            0F905555555555557FF75555555555500005555555555557777555555555550F
            F05555555555557F57F5555555555008F05555555555F775F755555555570000
            05555555555775577555555555700007555555555F755F775555555570000755
            55555555775F77555555555700075555555555F75F7755555555570007555555
            5555577F77555555555500075555555555557777555555555555}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = EditarClick
        end
        object BitExcluir: TBitBtn
          Left = 840
          Top = 4
          Width = 91
          Height = 25
          Caption = 'Excluir'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
          TabOrder = 1
          OnClick = BtExcluirClick
        end
        object BtFiltrar: TBitBtn
          Left = 360
          Top = 4
          Width = 131
          Height = 25
          Caption = 'Filtrar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          TabOrder = 2
          OnClick = BtFiltrarClick
        end
        object BTRemoveFiltro: TBitBtn
          Left = 520
          Top = 4
          Width = 121
          Height = 25
          Caption = 'Remover Filtro'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
            993337777F777F3377F3393999707333993337F77737333337FF993399933333
            399377F3777FF333377F993339903333399377F33737FF33377F993333707333
            399377F333377FF3377F993333101933399377F333777FFF377F993333000993
            399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
            99333773FF777F777733339993707339933333773FF7FFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
          TabOrder = 3
          OnClick = BTRemoveFiltroClick
        end
      end
    end
  end
  object Timer1: TTimer
    Interval = 100
    Left = 524
    Top = 552
  end
end
