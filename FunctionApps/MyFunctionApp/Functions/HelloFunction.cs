using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;
using System.Net;

namespace MyFunctionApp.Functions;

using System.Threading.Tasks;
public class HelloFunction
{
    private readonly ILogger _logger;

    public HelloFunction(ILoggerFactory loggerFactory)
    {
        _logger = loggerFactory.CreateLogger<HelloFunction>();
    }

    [Function("HelloFunction")]
    public async Task<HttpResponseData> Run(
        [HttpTrigger(AuthorizationLevel.Function, "get", "post")] HttpRequestData req)
    {
        _logger.LogInformation("C# HTTP trigger function processed a request.");

        var response = req.CreateResponse(HttpStatusCode.OK);
        await response.WriteStringAsync("Hello from Azure Function!");
        return response;
    }
}