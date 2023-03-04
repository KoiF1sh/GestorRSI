<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultarDepartamentos.aspx.cs" Inherits="GestorRSI.consultarDepartamentos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="~/Resources/css/GestorRSI.css" rel="stylesheet" /> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-dark bg-dark">
        <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl="~/Resources/png/logo1.png" Width="100px" />
        <b class="navbar-brand">Sistema Gestor de Empleados</b>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="./inicio.aspx">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./altaDepartamentos.aspx?op=C">Alta departamento</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Consultar departamentos<span class="sr-only">(current)</span></a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="./altaEmpleados.aspx?op=C">Alta empleado</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./consultarEmpleados.aspx">Consultar empleados</a>
                </li>
            </ul>
        </div>
    </nav>
        <div>

        <br />
        <div class="displayc">
            <h1>Departamentos - Listado de registros</h1>
        </div>
        <div class="displayc">
            <div class="table small padding5 displayc">
                <asp:GridView runat="server" ID="gvDepartamento" class="table content-table table-borderless table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="Opciones del administrador">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Ver" CssClass="btn small form-control-sm btn-info" ID="BtnRead" OnClick="BtnRead_Click"/>
                                <asp:Button runat="server" Text="Actualizar" CssClass="btn small form-control-sm btn-warning" ID="BtnUpdate" OnClick="BtnUpdate_Click"/>
                                <asp:Button runat="server" Text="Eliminar" CssClass="btn small form-control-sm btn-danger" ID="BtnDelete" OnClick="BtnDelete_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="padding1 displayc">
            <figure>
                <asp:Image ID="Image2" runat="server" Height="300px" ImageUrl="~/Resources/png/departamento1.png" Width="300px" />
            </figure>
        </div>

        </div>
    </form>
</body>
</html>
