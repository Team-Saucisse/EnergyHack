[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[%@ namespace name="System.Collections.Generic" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%
	System.Func<Property, bool> ShoudGenerateProperty = (Property p_property) => 
	{
		if (p_property.Relations != null && p_property.Relations.Count > 0 && p_property.Relations[0].RelationType == RelationType.ManyToMany)
			return false;
		return !p_property.IsBinaryLargeObject && !p_property.IsMetaData;
	};
%]
<ResourceDictionary
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:TheSaucisseFactory.App_GlobalResources">


  [%
  foreach(Entity entity in Producer.VisibleEntities)
  {
  bool l_isDerived = entity.BaseEntity != null && !entity.BaseEntity.Name.Equals(entity.Name);
  string l_comma = null;
  %]
  <!-- 
  *
  * [%=entity.Name%]
  *
  -->
  <x:String x:Key="[%=entity.Name%]CreateTable">
    CREATE TABLE IF NOT EXISTS [%=entity.Name%]
    ([%
    if (l_isDerived)
    {%]
    Id TEXT PRIMARY KEY NOT NULL[%
    }
	else
    {%]
    TypeName TEXT NOT NULL[%
    }
    l_comma = "";

    foreach(Property l_property in entity.Properties)
    {
	if (!ShoudGenerateProperty (l_property)) continue;

    string l_null = (l_property.IsNullable ? " " : "NOT ") + "NULL";
    l_comma = l_comma == null ? "" : ",";

    if (l_property.IsClrSimpleType)
    {
    string l_type = l_property.TypeName;
    string l_lenght = l_property.MaxLength.ToString();
    string l_typeAndLenght = "";

    if (l_type == "Guid")
    {
    l_typeAndLenght = "TEXT";
    }
    else if (l_type == "String")
    {
    l_typeAndLenght = "TEXT";
    }
    else if (l_type == "DateTime")
    {
    l_typeAndLenght = "NUMERIC";
    }
    else if (l_type == "Int32")
    {
    l_typeAndLenght = "INTEGER";
    }
    else if (l_type == "Boolean")
    {
    l_typeAndLenght = "NUMERIC";
    }

    if (l_property.Name == "Id")
    {
    l_typeAndLenght += " PRIMARY KEY";
    }

    %]
    [%=l_comma%] [%=l_property.Name%] [%=l_typeAndLenght%] [%=l_null%][%
    }
    else
    {
    if (l_property.IsEntity)
    {%]
    [%=l_comma%] [%=l_property.Name%]Id TEXT [%=l_null%][%
    }
    }
    }%]
    );
  </x:String>

  <x:String x:Key="[%=entity.Name%]LoadById">
    SELECT [%
    l_comma = null;
    if (l_isDerived)
    {
    foreach(Property l_property in entity.BaseEntity.Properties)
    {
	if (!ShoudGenerateProperty (l_property)) continue;
    l_comma = l_comma == null ? "" : ",";
    if (l_property.IsClrSimpleType)
    {
    %]
    [%=l_comma%] [%=entity.BaseEntity.Name%].[%=l_property.Name%][%
    }
    else
    {
    if (l_property.IsEntity)
    {%]
    [%=l_comma%] [%=entity.BaseEntity.Name%].[%=l_property.Name%]Id[%
    }
    }
    }
    }

    foreach(Property l_property in entity.Properties)
    {
	if (!ShoudGenerateProperty (l_property)) continue;
    l_comma = l_comma == null ? "" : ",";

    if (l_property.IsClrSimpleType)
    {
    %]
    [%=l_comma%] [%=entity.Name%].[%=l_property.Name%][%
    }
    else
    {
    if (l_property.IsEntity)
    {%]
    [%=l_comma%] [%=entity.Name%].[%=l_property.Name%]Id[%
    }
    }
    }%]
	, [%if (l_isDerived) {%][%=entity.BaseEntity.Name%][%} else {%][%=entity.Name%][%}%].TypeName
    FROM [%=entity.Name%][%if (l_isDerived) {%], [%=entity.BaseEntity.Name%][%}%]
    WHERE [%=entity.Name%].Id = @Id
    [%if (l_isDerived) {%]AND [%=entity.Name%].Id = [%=entity.BaseEntity.Name%].Id[%}%]
  </x:String>

  <x:String x:Key="[%=entity.Name%]LoadAll">
    SELECT [%
    l_comma = null;
    if (l_isDerived)
    {
    foreach(Property l_property in entity.BaseEntity.Properties)
    {
	if (!ShoudGenerateProperty (l_property)) continue;
    l_comma = l_comma == null ? "" : ",";
    if (l_property.IsClrSimpleType)
    {
    %]
    [%=l_comma%] [%=entity.BaseEntity.Name%].[%=l_property.Name%][%
    }
    else
    {
    if (l_property.IsEntity)
    {%]
    [%=l_comma%] [%=entity.BaseEntity.Name%].[%=l_property.Name%]Id[%
    }
    }
    }
    }

    foreach(Property l_property in entity.Properties)
    {
	if (!ShoudGenerateProperty (l_property)) continue;
    l_comma = l_comma == null ? "" : ",";

    if (l_property.IsClrSimpleType)
    {
    %]
    [%=l_comma%] [%=entity.Name%].[%=l_property.Name%][%
    }
    else
    {
    if (l_property.IsEntity)
    {%]
    [%=l_comma%] [%=entity.Name%].[%=l_property.Name%]Id[%
    }
    }
    }%] 
	, [%if (l_isDerived) {%][%=entity.BaseEntity.Name%][%} else {%][%=entity.Name%][%}%].TypeName
    FROM [%=entity.Name%][%if (l_isDerived) {%], [%=entity.BaseEntity.Name%] WHERE [%=entity.Name%].Id = [%=entity.BaseEntity.Name%].Id[%}%]
  </x:String>

  <!-- Chargement par entité liée -->
  [%foreach(Property l_relatedProperty in entity.Properties)
  {
    if (l_relatedProperty.IsEntity)
    {
    %]
  <x:String x:Key="[%=entity.Name%]LoadBy[%=l_relatedProperty.Name%]">
      SELECT [%
      l_comma = null;
      if (l_isDerived)
      {
      foreach(Property l_property in entity.BaseEntity.Properties)
      {
	  if (!ShoudGenerateProperty (l_property)) continue;
      l_comma = l_comma == null ? "" : ",";
      if (l_property.IsClrSimpleType)
      {
      %]
      [%=l_comma%] [%=entity.BaseEntity.Name%].[%=l_property.Name%][%
      }
      else
      {
      if (l_property.IsEntity)
      {%]
      [%=l_comma%] [%=entity.BaseEntity.Name%].[%=l_property.Name%]Id[%
      }
      }
      }
      }

      foreach(Property l_property in entity.Properties)
      {
   	  if (!ShoudGenerateProperty (l_property)) continue;
      l_comma = l_comma == null ? "" : ",";

      if (l_property.IsClrSimpleType)
      {
      %]
      [%=l_comma%] [%=entity.Name%].[%=l_property.Name%][%
      }
      else
      {
      if (l_property.IsEntity)
      {%]
      [%=l_comma%] [%=entity.Name%].[%=l_property.Name%]Id[%
      }
      }
      }%]
	, [%if (l_isDerived) {%][%=entity.BaseEntity.Name%][%} else {%][%=entity.Name%][%}%].TypeName
    FROM [%=entity.Name%][%if (l_isDerived) {%], [%=entity.BaseEntity.Name%][%}%]
    WHERE [%=entity.Name%].[%=l_relatedProperty.Name%]Id = @[%=l_relatedProperty.Name%]Id
    [%if (l_isDerived) {%]AND [%=entity.Name%].Id = [%=entity.BaseEntity.Name%].Id[%}%]
  </x:String>[%
  }
  }%]
  <x:String x:Key="[%=entity.Name%]Save">
    INSERT OR REPLACE INTO
    [%=entity.Name%] (Id[%if (!l_isDerived){%], TypeName[%}
    foreach(Property l_property in entity.Properties)
    {
	if (!ShoudGenerateProperty (l_property)) continue;
	if (l_property.Name == "Id")  continue;

    if (l_property.IsClrSimpleType)
    {
    %], [%=l_property.Name%][%
    }
    else
    {
    if (l_property.IsEntity)
    {%], [%=l_property.Name%]Id[%
    }
    }
    }%])
    VALUES(@Id[%if (!l_isDerived){%], @TypeName[%}
    foreach(Property l_property in entity.Properties)
    {
	if (!ShoudGenerateProperty (l_property)) continue;
	if (l_property.Name == "Id")  continue;

    if (l_property.IsClrSimpleType)
    {
    %], @[%=l_property.Name%][%
    }
    else
    {
    if (l_property.IsEntity)
    {%], @[%=l_property.Name%]Id[%
    }
    }
    }%]);
  </x:String>

  <x:String x:Key="[%=entity.Name%]Delete">
    DELETE FROM [%=entity.Name%] WHERE Id = @Id;
  </x:String>
  [%
  }
  %]

</ResourceDictionary>
