# Este é o módulo responsável pela conexão com o banco de dados. Todas as rotinas que interagem com o banco estão aqui.
import pyodbc
import os
import pandas as pd


def conectar_bd():
    # Substitua 'server', 'username' e 'password' pelas suas credenciais
    dados_conexao = (
        "Driver={SQL Server};"
        "Server=server;"
        "Database=PraticasBD;"
        "UID=username;"
        "PWD=password"
    )
    # Tentativa de conexão
    try:
        conexao = pyodbc.connect(dados_conexao)
        if conexao:
            print("----- Conexão com banco de dados estabelecida com sucesso! -----")
        else:
            print("----- Falha ao estabelecer conexão com banco de dados. -----")
    except pyodbc.Error as error:
        print("----- Erro ao estabelecer conexão com banco de dados:", error, " -----")
    finally:
        return conexao


def fechar_conexao_bd(conexao):
    conexao.close()


def carregar_dados(conexao, tabela):
    query = f"SELECT * FROM {tabela}"
    df = pd.read_sql(query, conexao)
    return df


def carregar_dados_csv(arquivo):
    # Caminho completo para o arquivo CSV    
    caminho_arquivo = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(""))), "data", ".csvs", arquivo)
    try:
        if os.path.exists(caminho_arquivo):
            df = pd.read_csv(caminho_arquivo, sep=";")
            return df
        else:
            print("----- Arquivo não encontrado! -----")
    except:
        print("----- Erro ao carregar os dados do arquivo .CSV fornecido! Certifique-se de que o arquivo está localizado no caminho especificado. -----")