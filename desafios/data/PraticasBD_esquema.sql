USE [master]
GO
/****** Object:  Database [PraticasBD]    Script Date: 07/06/2024 23:37:54 ******/
CREATE DATABASE [PraticasBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PraticesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PraticesDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PraticesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PraticesDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PraticasBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PraticasBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PraticasBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PraticasBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PraticasBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PraticasBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PraticasBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [PraticasBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PraticasBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PraticasBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PraticasBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PraticasBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PraticasBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PraticasBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PraticasBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PraticasBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PraticasBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PraticasBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PraticasBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PraticasBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PraticasBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PraticasBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PraticasBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PraticasBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PraticasBD] SET RECOVERY FULL 
GO
ALTER DATABASE [PraticasBD] SET  MULTI_USER 
GO
ALTER DATABASE [PraticasBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PraticasBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PraticasBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PraticasBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PraticasBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PraticasBD', N'ON'
GO
ALTER DATABASE [PraticasBD] SET QUERY_STORE = OFF
GO
USE [PraticasBD]
GO
/****** Object:  Table [dbo].[assinaturas]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assinaturas](
	[usuario_id] [int] NOT NULL,
	[data_inicio] [date] NOT NULL,
	[data_termino] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[atribuicoes]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atribuicoes](
	[sessao_id] [int] NOT NULL,
	[canal] [varchar](255) NULL,
	[conversao] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comentarios]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comentarios](
	[usuario_id] [int] NULL,
	[corpo] [varchar](max) NOT NULL,
	[data_criacao] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funcionarios]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
	[sobrenome] [varchar](255) NULL,
	[salario] [int] NULL,
	[departamento_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funcionarios_equipes]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionarios_equipes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
	[gerente_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gerentes]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gerentes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
	[equipe] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localizacoes]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localizacoes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
	[cidade_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NOT NULL,
	[data_criacao] [datetime] NOT NULL,
	[produto_id] [int] NOT NULL,
	[quantidade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pontuacoes]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pontuacoes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estudante] [varchar](255) NULL,
	[pontuacao] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produtos]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produtos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[preco] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transacoes_bancarias]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transacoes_bancarias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data_criacao] [datetime] NULL,
	[valor_transacao] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[data_criacao] [datetime] NULL,
	[localizacao_id] [int] NULL,
	[email] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios_sessoes]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_sessoes](
	[sessao_id] [int] NOT NULL,
	[data_criacao] [datetime] NULL,
	[usuario_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viagens]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viagens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[passageiro_usuario_id] [int] NOT NULL,
	[distancia] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voos]    Script Date: 07/06/2024 23:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aeroporto_origem] [varchar](255) NULL,
	[local_origem] [varchar](255) NULL,
	[aeroporto_destino] [varchar](255) NULL,
	[local_destino] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[assinaturas] ([usuario_id], [data_inicio], [data_termino]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[assinaturas] ([usuario_id], [data_inicio], [data_termino]) VALUES (2, CAST(N'2019-01-15' AS Date), CAST(N'2019-01-17' AS Date))
INSERT [dbo].[assinaturas] ([usuario_id], [data_inicio], [data_termino]) VALUES (3, CAST(N'2019-01-29' AS Date), CAST(N'2019-02-04' AS Date))
INSERT [dbo].[assinaturas] ([usuario_id], [data_inicio], [data_termino]) VALUES (4, CAST(N'2019-02-05' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[assinaturas] ([usuario_id], [data_inicio], [data_termino]) VALUES (5, CAST(N'2019-03-07' AS Date), NULL)
INSERT [dbo].[assinaturas] ([usuario_id], [data_inicio], [data_termino]) VALUES (6, CAST(N'2019-02-01' AS Date), NULL)
GO
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (1, N'facebook', 0)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (2, N'facebook', 1)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (3, N'email', 0)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (4, N'facebook', 0)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (5, N'email', 1)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (6, N'organico', 0)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (7, N'organico', 0)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (8, N'facebook', 1)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (9, N'email', 0)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (10, N'email', 1)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (11, N'google', 1)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (12, N'google', 0)
INSERT [dbo].[atribuicoes] ([sessao_id], [canal], [conversao]) VALUES (13, N'google', 0)
GO
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (3, N'Pensando mais a longo prazo, o fenômeno da Internet nos obriga à análise do levantamento das variáveis envolvidas.', CAST(N'2019-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'Do mesmo modo, a hegemonia do ambiente político exige a precisão e a definição das regras de conduta normativas.', CAST(N'2019-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (3, N'É claro que a complexidade dos estudos efetuados possibilita uma melhor visão global dos paradigmas corporativos.', CAST(N'2019-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o comprometimento entre as equipes representa uma abertura para a melhoria das condições inegavelmente apropriadas.', CAST(N'2019-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (2, N'Percebemos, cada vez mais, que o acompanhamento das preferências de consumo talvez venha a ressaltar a relatividade do processo de comunicação como um todo.', CAST(N'2019-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'É claro que a revolução dos costumes é uma das consequências da gestão inovadora da qual fazemos parte.', CAST(N'2019-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (1, N'A nível organizacional, o consenso sobre a necessidade de qualificação cumpre um papel essencial na formulação dos paradigmas corporativos.', CAST(N'2020-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (1, N'As experiências acumuladas demonstram que a complexidade dos estudos efetuados agrega valor ao estabelecimento de alternativas às soluções ortodoxas.', CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (3, N'A certificação de metodologias que nos auxiliam a lidar com a valorização de fatores subjetivos possibilita uma melhor visão global das formas de ação.', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (3, N'Do mesmo modo, a valorização de fatores subjetivos assume importantes posições no estabelecimento da gestão inovadora da qual fazemos parte.', CAST(N'2020-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (3, N'Caros amigos, o início da atividade geral de formação de atitudes afeta positivamente a correta previsão das direções preferenciais no sentido do progresso.', CAST(N'2020-01-16T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'No entanto, não podemos esquecer que o acompanhamento das preferências de consumo cumpre um papel essencial na formulação dos conhecimentos estratégicos para atingir a excelência.', CAST(N'2020-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'O empenho em analisar o comprometimento entre as equipes apresenta tendências no sentido de aprovar a manutenção dos relacionamentos verticais entre as hierarquias.', CAST(N'2020-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'Gostaria de enfatizar que o julgamento imparcial das eventualidades obstaculiza a apreciação da importância das condições financeiras e administrativas exigidas.', CAST(N'2020-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'No mundo atual, o comprometimento entre as equipes auxilia a preparação e a composição das regras de conduta normativas.', CAST(N'2020-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (5, N'A nível organizacional, o novo modelo estrutural aqui preconizado faz parte de um processo de gerenciamento do impacto na agilidade decisória.', CAST(N'2020-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (1, N'O incentivo ao avanço tecnológico, assim como a percepção das dificuldades assume importantes posições no estabelecimento dos conhecimentos estratégicos para atingir a excelência.', CAST(N'2020-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (3, N'O cuidado em identificar pontos críticos na constante divulgação das informações agrega valor ao estabelecimento de todos os recursos funcionais envolvidos.', CAST(N'2020-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (4, N'É claro que a necessidade de renovação processual apresenta tendências no sentido de aprovar a manutenção do retorno esperado a longo prazo.', CAST(N'2020-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[comentarios] ([usuario_id], [corpo], [data_criacao]) VALUES (4, N'Por conseguinte, a constante divulgação das informações ainda não demonstrou convincentemente que vai participar na mudança das diretrizes de desenvolvimento para o futuro.', CAST(N'2020-01-28T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[departamentos] ON 

INSERT [dbo].[departamentos] ([id], [nome]) VALUES (1, N'Recursos Humanos')
INSERT [dbo].[departamentos] ([id], [nome]) VALUES (2, N'Marketing')
INSERT [dbo].[departamentos] ([id], [nome]) VALUES (3, N'Engenharia')
INSERT [dbo].[departamentos] ([id], [nome]) VALUES (4, N'Vendas')
INSERT [dbo].[departamentos] ([id], [nome]) VALUES (5, N'Financeiro')
SET IDENTITY_INSERT [dbo].[departamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[funcionarios] ON 

INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (1, N'João', N'Silva', 3000, 1)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (2, N'Maria', N'Souza', 4000, 2)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (3, N'Carlos', N'Oliveira', 6500, 3)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (4, N'Ana', N'Pereira', 3200, 1)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (5, N'Pedro', N'Costa', 3900, 2)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (6, N'Yago', N'Silva', 4500, 2)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (7, N'Joana', N'Santos', 6500, 3)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (8, N'José', N'Gomes', 6000, 3)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (9, N'Ana', N'Nunes', 5900, 3)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (10, N'Francisco', N'Correia', 3500, 1)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (11, N'Raquel', N'Ferreira', 6000, 4)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (12, N'Suzana', N'Costa', 8000, 4)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (13, N'Roberto', N'Fernandes', 3500, 5)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (14, N'Miguel', N'Moreia', 3800, 5)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (15, N'Heitor', N'Mendes', 4100, 5)
INSERT [dbo].[funcionarios] ([id], [nome], [sobrenome], [salario], [departamento_id]) VALUES (16, N'Laura', N'Jesus', 4100, 5)
SET IDENTITY_INSERT [dbo].[funcionarios] OFF
GO
SET IDENTITY_INSERT [dbo].[funcionarios_equipes] ON 

INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (1, N'José Oliveira', 1)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (2, N'Patrícia Santos', 1)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (3, N'Fernando Martins', 1)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (4, N'Camila Silva', 1)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (5, N'Ricardo Pereira', 2)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (6, N'Aline Costa', 2)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (7, N'Daniel Mendes', 3)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (8, N'Mariana Rodrigues', 3)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (9, N'Gustavo Almeida', 3)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (10, N'Carla Fernandes', 4)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (11, N'Marcos Vieira', 4)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (12, N'Juliana Lima', 4)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (13, N'Lucas Sousa', 4)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (14, N'Bianca Carvalho', 4)
INSERT [dbo].[funcionarios_equipes] ([id], [nome], [gerente_id]) VALUES (15, N'Roberto Nunes', 5)
SET IDENTITY_INSERT [dbo].[funcionarios_equipes] OFF
GO
SET IDENTITY_INSERT [dbo].[gerentes] ON 

INSERT [dbo].[gerentes] ([id], [nome], [equipe]) VALUES (1, N'João Silva', N'Equipe A')
INSERT [dbo].[gerentes] ([id], [nome], [equipe]) VALUES (2, N'Maria Oliveira', N'Equipe B')
INSERT [dbo].[gerentes] ([id], [nome], [equipe]) VALUES (3, N'Carlos Santos', N'Equipe C')
INSERT [dbo].[gerentes] ([id], [nome], [equipe]) VALUES (4, N'Ana Rodrigues', N'Equipe D')
INSERT [dbo].[gerentes] ([id], [nome], [equipe]) VALUES (5, N'Pedro Sousa', N'Equipe E')
SET IDENTITY_INSERT [dbo].[gerentes] OFF
GO
SET IDENTITY_INSERT [dbo].[localizacoes] ON 

INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (1, N'Pinheiros', 1)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (2, N'Vila Madalena', 1)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (3, N'Copacabana', 2)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (4, N'Barra da Tijuca', 2)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (5, N'Savassi', 3)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (6, N'Buritis', 3)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (7, N'Jardim Camburi', 4)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (8, N'Itaparica', 4)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (9, N'Itapuã', 5)
INSERT [dbo].[localizacoes] ([id], [nome], [cidade_id]) VALUES (10, N'Guararapes', 6)
SET IDENTITY_INSERT [dbo].[localizacoes] OFF
GO
SET IDENTITY_INSERT [dbo].[pedidos] ON 

INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, 10)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (2, 3, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (3, 4, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (4, 5, CAST(N'2019-01-02T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (5, 5, CAST(N'2019-01-06T00:00:00.000' AS DateTime), 3, 14)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (6, 4, CAST(N'2019-01-06T00:00:00.000' AS DateTime), 3, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (7, 3, CAST(N'2019-01-06T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (8, 2, CAST(N'2019-02-02T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (9, 4, CAST(N'2019-02-04T00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (10, 3, CAST(N'2019-02-04T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (11, 5, CAST(N'2019-02-04T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (12, 1, CAST(N'2019-05-03T00:00:00.000' AS DateTime), 2, 10)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (13, 2, CAST(N'2019-05-06T00:00:00.000' AS DateTime), 2, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (14, 3, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (15, 5, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (16, 4, CAST(N'2019-05-09T00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (17, 2, CAST(N'2019-06-04T00:00:00.000' AS DateTime), 2, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (18, 5, CAST(N'2019-06-16T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (19, 5, CAST(N'2019-08-12T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (20, 3, CAST(N'2019-11-10T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (21, 5, CAST(N'2019-11-10T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (22, 1, CAST(N'2020-04-05T00:00:00.000' AS DateTime), 2, 10)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (23, 2, CAST(N'2020-04-12T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (24, 2, CAST(N'2020-05-16T00:00:00.000' AS DateTime), 3, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (25, 1, CAST(N'2020-06-08T00:00:00.000' AS DateTime), 2, 10)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (26, 4, CAST(N'2020-06-16T00:00:00.000' AS DateTime), 3, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (27, 3, CAST(N'2020-06-16T00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (28, 2, CAST(N'2020-07-09T00:00:00.000' AS DateTime), 2, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (29, 3, CAST(N'2020-08-12T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (30, 4, CAST(N'2020-08-12T00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (31, 4, CAST(N'2020-08-19T00:00:00.000' AS DateTime), 1, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (32, 3, CAST(N'2020-08-19T00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (33, 3, CAST(N'2020-09-25T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (34, 4, CAST(N'2020-09-25T00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (35, 2, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (36, 4, CAST(N'2020-10-15T00:00:00.000' AS DateTime), 1, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (37, 4, CAST(N'2020-11-10T00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (38, 1, CAST(N'2020-12-09T00:00:00.000' AS DateTime), 1, 10)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (39, 1, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 1, 10)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (40, 2, CAST(N'2021-08-19T00:00:00.000' AS DateTime), 3, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (41, 2, CAST(N'2021-09-25T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (42, 4, CAST(N'2021-12-31T00:00:00.000' AS DateTime), 2, 18)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (43, 9, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, 5)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (44, 9, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 10, 5)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (45, 5, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (46, 5, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 9, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (47, 7, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (48, 7, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 8, 1)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (49, 2, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 4, 6)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (50, 2, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 7, 6)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (51, 3, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (52, 3, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 6, 2)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (53, 12, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (54, 12, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 10, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (55, 15, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (56, 15, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 9, 4)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (57, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 3, 6)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (58, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 8, 6)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (59, 4, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 4, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (60, 4, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 7, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (61, 8, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, 7)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (62, 8, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 10, 7)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (63, 13, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (64, 13, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 9, 4)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (65, 10, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 3, 5)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (66, 10, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 8, 5)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (67, 14, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (68, 14, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 10, 8)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (69, 11, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (70, 11, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 9, 3)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (71, 6, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, 7)
INSERT [dbo].[pedidos] ([id], [usuario_id], [data_criacao], [produto_id], [quantidade]) VALUES (72, 6, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 10, 7)
SET IDENTITY_INSERT [dbo].[pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[pontuacoes] ON 

INSERT [dbo].[pontuacoes] ([id], [estudante], [pontuacao]) VALUES (1, N'Jackson', 425)
INSERT [dbo].[pontuacoes] ([id], [estudante], [pontuacao]) VALUES (2, N'Alice', 502)
INSERT [dbo].[pontuacoes] ([id], [estudante], [pontuacao]) VALUES (3, N'Milena', 550)
INSERT [dbo].[pontuacoes] ([id], [estudante], [pontuacao]) VALUES (4, N'Samuel', 525)
SET IDENTITY_INSERT [dbo].[pontuacoes] OFF
GO
SET IDENTITY_INSERT [dbo].[produtos] ON 

INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (1, N'Pão de forma', 10.15)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (2, N'Macarrão', 4.2)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (3, N'Café', 14.9)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (4, N'Vinho', 89.9)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (5, N'Leite', 6.1)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (6, N'Cereal matinal', 15.6)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (7, N'Saca rolha', 32.8)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (8, N'Filtro descartável', 5.5)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (9, N'Molho de tomate', 2.7)
INSERT [dbo].[produtos] ([id], [nome], [preco]) VALUES (10, N'Manteiga', 14.2)
SET IDENTITY_INSERT [dbo].[produtos] OFF
GO
SET IDENTITY_INSERT [dbo].[transacoes_bancarias] ON 

INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (1, CAST(N'2020-10-01T13:15:45.000' AS DateTime), 100)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (2, CAST(N'2020-10-01T15:10:00.000' AS DateTime), 55.9)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (3, CAST(N'2020-10-02T08:15:30.000' AS DateTime), 12.5)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (4, CAST(N'2020-10-02T08:35:00.000' AS DateTime), 220)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (5, CAST(N'2020-10-02T09:40:50.000' AS DateTime), 330.88)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (6, CAST(N'2020-10-03T23:49:20.000' AS DateTime), 14.1)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (7, CAST(N'2020-10-03T23:49:35.000' AS DateTime), 25.3)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (8, CAST(N'2020-10-04T11:14:10.000' AS DateTime), 600)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (9, CAST(N'2020-10-05T09:50:00.000' AS DateTime), 99.15)
INSERT [dbo].[transacoes_bancarias] ([id], [data_criacao], [valor_transacao]) VALUES (10, CAST(N'2020-10-05T12:30:00.000' AS DateTime), 118.45)
SET IDENTITY_INSERT [dbo].[transacoes_bancarias] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (1, N'João Silva', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 1, N'joao.silva@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (2, N'Maria Souza', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 2, N'maria.souza@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (3, N'Carlos Oliveira', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 3, N'carlos.oliveira@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (4, N'Ana Pereira', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 1, N'ana.pereira@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (5, N'Pedro Costa', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 2, N'pedro.costa@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (6, N'Yago Silva', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 4, N'yago.silva@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (7, N'Joana Santos', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 6, N'joana.santos@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (8, N'José Gomes', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'jose.gomes@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (9, N'Ana Nunes', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'ana.nunes@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (10, N'Francisco Correia', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'francisco.correia@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (11, N'Raquel Ferreira', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'raquel.costa@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (12, N'Suzana Costa', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'suzana.costa@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (13, N'Roberto Fernandes', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'roberto.fernandes@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (14, N'Miguel Moreia', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'miguel.moreira@empresa.com')
INSERT [dbo].[usuarios] ([id], [nome], [data_criacao], [localizacao_id], [email]) VALUES (15, N'Heitor Mendes', CAST(N'2020-02-02T00:00:00.000' AS DateTime), 6, N'heitor.mendes@empresa.com')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (1, CAST(N'2020-09-28T19:20:10.000' AS DateTime), 1)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (2, CAST(N'2019-09-12T23:37:15.000' AS DateTime), 2)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (3, CAST(N'2020-08-28T14:46:25.000' AS DateTime), 1)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (4, CAST(N'2019-11-16T10:55:45.000' AS DateTime), 3)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (5, CAST(N'2020-10-24T12:14:12.000' AS DateTime), 4)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (6, CAST(N'2020-04-06T15:13:13.000' AS DateTime), 5)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (7, CAST(N'2020-01-28T23:05:59.000' AS DateTime), 6)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (8, CAST(N'2020-02-28T15:08:46.000' AS DateTime), 7)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (9, CAST(N'2020-03-29T18:15:28.000' AS DateTime), 8)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (10, CAST(N'2019-08-24T22:21:00.000' AS DateTime), 7)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (11, CAST(N'2019-09-25T12:00:00.000' AS DateTime), 8)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (12, CAST(N'2019-09-30T13:15:48.000' AS DateTime), 9)
INSERT [dbo].[usuarios_sessoes] ([sessao_id], [data_criacao], [usuario_id]) VALUES (13, CAST(N'2019-12-31T14:10:56.000' AS DateTime), 10)
GO
SET IDENTITY_INSERT [dbo].[viagens] ON 

INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (2, 1, 12)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (3, 1, 12)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (4, 1, 11)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (5, 2, 7)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (6, 2, 3)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (7, 3, 10)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (8, 3, 2)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (9, 4, 5)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (10, 4, 5)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (11, 4, 5)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (12, 4, 5)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (13, 5, 7)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (14, 5, 7)
INSERT [dbo].[viagens] ([id], [passageiro_usuario_id], [distancia]) VALUES (15, 6, 20)
SET IDENTITY_INSERT [dbo].[viagens] OFF
GO
SET IDENTITY_INSERT [dbo].[voos] ON 

INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (1, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional de Brasília', N'Distrito Federal')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (2, N'Aeroporto Internacional de Brasília', N'Distrito Federal', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (3, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (4, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (5, N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (6, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (7, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (8, N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (9, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (10, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (11, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (12, N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (13, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (14, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (15, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional de Brasília', N'Distrito Federal')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (16, N'Aeroporto Internacional de Brasília', N'Distrito Federal', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (17, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (18, N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (19, N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (20, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (21, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional de Brasília', N'Distrito Federal')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (22, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (23, N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (24, N'Aeroporto Internacional de Brasília', N'Distrito Federal', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (25, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (26, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (27, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (28, N'Aeroporto Internacional de Belo Horizonte-Confins', N'Minas Gerais', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (29, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (30, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (31, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (32, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (33, N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco', N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (34, N'Aeroporto Internacional de Salvador-Dep. Luís Eduardo Magalhães', N'Bahia', N'Aeroporto Internacional do Recife-Guararapes', N'Pernambuco')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (35, N'Aeroporto de São Paulo-Congonhas', N'São Paulo', N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro')
INSERT [dbo].[voos] ([id], [aeroporto_origem], [local_origem], [aeroporto_destino], [local_destino]) VALUES (36, N'Aeroporto Internacional Tom Jobim-Rio Galeão', N'Rio de Janeiro', N'Aeroporto de São Paulo-Congonhas', N'São Paulo')
SET IDENTITY_INSERT [dbo].[voos] OFF
GO
ALTER TABLE [dbo].[comentarios] ADD  DEFAULT (getdate()) FOR [data_criacao]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [data_criacao]
GO
ALTER TABLE [dbo].[assinaturas]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[comentarios]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[funcionarios]  WITH CHECK ADD FOREIGN KEY([departamento_id])
REFERENCES [dbo].[departamentos] ([id])
GO
ALTER TABLE [dbo].[funcionarios_equipes]  WITH CHECK ADD FOREIGN KEY([gerente_id])
REFERENCES [dbo].[gerentes] ([id])
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([produto_id])
REFERENCES [dbo].[produtos] ([id])
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([localizacao_id])
REFERENCES [dbo].[localizacoes] ([id])
GO
ALTER TABLE [dbo].[usuarios_sessoes]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[viagens]  WITH CHECK ADD FOREIGN KEY([passageiro_usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
USE [master]
GO
ALTER DATABASE [PraticasBD] SET  READ_WRITE 
GO
