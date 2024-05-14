using Shop.Data;
using Shop.Services.Automapper;
using Shop.Services.Extensions;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAutoMapper(typeof(ServicesProfile));
builder.Services.AddControllers();
builder.Services.AddShopContext(builder.Configuration.GetConnectionString("Shop"));
builder.Services.AddServices();

var app = builder.Build();

app.MapControllers();

app.Run();
