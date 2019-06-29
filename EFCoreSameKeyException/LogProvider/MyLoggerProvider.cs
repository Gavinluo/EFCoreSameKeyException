using EFCoreSameKeyException.LogProvider;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFCoreSameKeyException
{
    public class MyLoggerProvider : ILoggerProvider
    {
        public ILogger CreateLogger(string categoryName) => new MyLogger(categoryName);
        public void Dispose() { }
    }
}
