[%@ namespace name="CodeFluent.Model"%]
[%@ namespace name="CodeFluent.Model.Persistence"%]
/* [%=Producer.GetSignature()%] */
[%foreach(Table table in Producer.Project.Database.Tables) { if (table.Indexes.Count == 0) continue;%]
[%foreach(CodeFluent.Model.Persistence.Index idx in table.Indexes) {%]
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[[%=CodeFluent.Producers.SqlServer.SqlServerProducer.GetOwner(table)%]].[%=table.FullName%]') 
   AND name = N'[%=idx.ShortName%]')
DROP INDEX [[%=idx.ShortName%]] ON [[%=CodeFluent.Producers.SqlServer.SqlServerProducer.GetOwner(table)%]].[%=table.FullName%]

CREATE [%=CodeFluent.Producers.SqlServer.SqlServerProducer.GetHint(idx)%] INDEX [[%=idx.ShortName%]] ON [[%=CodeFluent.Producers.SqlServer.SqlServerProducer.GetOwner(table)%]].[%=table.FullName%] (
[%for(int i = 0; i < idx.Columns.Count; i++) {%]
[%if(i != 0){%], [%}%][[%=idx.Columns[i].Name%]]
[%}%]
)
[%}%]
[%}%]