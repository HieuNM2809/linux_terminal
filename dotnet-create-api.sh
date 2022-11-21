export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH="$PATH:$HOME/.dotnet/tools/"

mysql -u root -e "drop database if exists AppApi;"
mysql -u root -e "create database AppApi;"


dotnet new webapi -o AppApi
cd AppApi

dotnet dev-certs https --trust
dotnet add package Microsoft.EntityFrameworkCore.InMemory --version=6.*
dotnet add package Microsoft.EntityFrameworkCore.Design --version=6.*
dotnet add package Pomelo.EntityFrameworkCore.MySql --version=6.*

dotnet tool install --global dotnet-ef

mkdir Models
cd Models
touch Post.cs
cat>Post.cs<<"exit"
namespace AppApi.Models
{
    public class Post
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public DateTime DeletedAt { get; set; }
    }
}
exit
cd ..
sed -i '8 a ,"ConnectionStrings": {"Default": "Server=localhost;User ID=root;Password=;Database=AppApi"}' appsettings.json
dotnet ef dbcontext scaffold Name=Default Pomelo.EntityFrameworkCore.MySql --output-dir Models --context-dir Data --namespace AppApi.Models --context-namespace AppApi.Data --context PostContext -f --no-onconfiguring
sed -i '9 i builder.Services.AddDbContext<PostContext>(    options => {        options.UseMySql(builder.Configuration.GetConnectionString("Default"),        Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.23-mysql"));    });' Program.cs
sed -i '1 i using AppApi.Data;' Program.cs
sed -i '1 i using Microsoft.EntityFrameworkCore;' Program.cs
sed -i '28 a public DbSet<Post> Posts { get; set; } = null!;' Data/PostContext.cs
dotnet ef migrations add InitialCreate -c PostContext
dotnet ef database update
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version=6.*
dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design --version=6.*
dotnet-aspnet-codegenerator controller -name PostController -async -api -m Post -dc PostContext -outDir Controllers
dotnet run
