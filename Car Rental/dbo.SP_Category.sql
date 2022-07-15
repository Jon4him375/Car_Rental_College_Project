CREATE PROCEDURE [dbo].[SP_Catagory]
@CategoriesName nvarchar(50),	
@img nvarchar(MAX)

as
begin
Update Categories
Set @CategoriesName=@CategoriesName, @img=@img 
where @CategoriesName=@CategoriesName
end
RETURN 0
