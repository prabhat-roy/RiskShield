// Root Lighthouse CI config for RiskShield — gated in CI on every PR touching frontend/
module.exports = {
  ci: {
    collect: {
      url: [
        "https://www.riskshield.internal/",
        "https://app.riskshield.internal/",
        "https://admin.riskshield.internal/"
      ],
      numberOfRuns: 3,
      settings: { preset: "desktop" }
    },
    assert: {
      assertions: {
        "categories:performance":   ["error", { minScore: 0.85 }],
        "categories:accessibility": ["error", { minScore: 0.95 }],
        "categories:best-practices":["warn",  { minScore: 0.9 }],
        "categories:seo":           ["error", { minScore: 0.9 }]
      }
    },
    upload: { target: "lhci", serverBaseUrl: "https://lhci.riskshield.internal" }
  }
};
