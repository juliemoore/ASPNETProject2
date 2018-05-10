using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SportsPro.Startup))]
namespace SportsPro
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
