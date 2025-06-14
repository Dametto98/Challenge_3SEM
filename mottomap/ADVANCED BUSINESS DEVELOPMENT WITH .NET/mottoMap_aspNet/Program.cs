
using Microsoft.EntityFrameworkCore;
using MotoMap.Api.DotNet.Data; 
var builder = WebApplication.CreateBuilder(args);


var connectionString = builder.Configuration.GetConnectionString("OracleConnection");
builder.Services.AddDbContext<MotoMapDbContext>(options =>
    options.UseOracle(connectionString));


builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization(); 

app.MapControllers();

app.Run();