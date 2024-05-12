using Shop.Data;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddShopContext(builder.Configuration.GetConnectionString("Shop"));

var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.Run();
