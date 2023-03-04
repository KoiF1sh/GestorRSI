<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="altaEmpleados.aspx.cs" Inherits="GestorRSI.altaEmpleados" %>

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
                <li class="nav-item">
                    <a class="nav-link" href="./consultarDepartamentos.aspx">Consultar departamentos</a>
                </li>
                 <li class="nav-item active">
                    <a class="nav-link" href="#">Alta empleado<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./consultarEmpleados.aspx">Consultar empleados</a>
                </li>
            </ul>
        </div>
    </nav>
        <div>
            <div class="padding1 displayc">
            <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
            <h2>Departamentos - Datos del registro</h2>
        </div>

        <div class="padding5">
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbNombre"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de nacimiento</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbFechaNacimiento"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Direccion</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbDireccion"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Departamento</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbDepartamento"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de ingreso</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbFechaIngreso"></asp:TextBox>
            </div>
            <asp:Button runat="server" CssClass="btn btn-primary btn-dark" ID="BtnVolver" Text="Volver" Visible="True" OnClick="BtnVolver_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnCreate" Text="Crear" Visible="false" OnClick="BtnCreate_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnUpdate" Text="Actualizar" Visible="false" OnClick="BtnUpdate_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Eliminar" Visible="false" OnClick="BtnDelete_Click"/>            
        </div>
        <div class="padding1 displayc">
            <figure>
                <asp:Image ID="Image2" runat="server" Height="300px" ImageUrl="~/Resources/png/empleados1.png" Width="300px" />
            </figure>
        </div>
        </div>
    </form>
</body>
</html>
