using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
//Added
using DataSynthesis.Data.EF.models;

namespace DataSynthesis.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RefDataStatusController : ControllerBase
    {
        private datasynthesisContext _context;

        public RefDataStatusController(datasynthesisContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return Ok(_context.RefdataStatus.ToArray());
        }
    }
}
