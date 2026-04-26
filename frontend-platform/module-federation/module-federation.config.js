// Module Federation across RiskShield frontends (storefront / admin / partner / mobile-web)
const { ModuleFederationPlugin } = require("@module-federation/enhanced/webpack");
module.exports = {
  plugins: [
    new ModuleFederationPlugin({
      name: "riskshield_shell",
      remotes: {
        admin: "admin@https://admin.riskshield.internal/remoteEntry.js",
        partner: "partner@https://partner.riskshield.internal/remoteEntry.js",
      },
      shared: { react: { singleton: true }, "react-dom": { singleton: true } },
    }),
  ],
};
