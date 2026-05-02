create DATABASE Saldo_da_conta_arquivo_TXT
GO

use Saldo_da_conta_arquivo_TXT
GO

create table Conta(
    id int,
    valor int,
    acao varchar(1)
)
GO

alter table Conta
    alter column acao varchar(5)
GO

bulk insert conta
from "/var/opt/mssql/data/import/CONTAS.txt"
with(
    firstrow = 2,
    datafiletype = 'char',
    fieldterminator = '\t',
    rowterminator = '\n'
)
GO

select id,
    sum(CASE WHEN (charindex('D', acao) != 0) THEN valor * -1 ELSE valor END) as Saldo_total
from Conta
group by(id)
GO