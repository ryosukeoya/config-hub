module.exports = {
  disableEmoji: true,
  format: "{type}{scope}: {emoji}{subject}",
  list: ["feat", "fix", "docs", "style", "refactor", "perf", "test", "chore"],
  maxMessageLength: 64,
  minMessageLength: 3,
  questions: ["type", "scope", "subject", "body"],
  scopes: [],
  types: {
    feat: {
      description: "新しい機能",
      emoji: "🎸",
      value: "feat",
    },
    fix: {
      description: "バグ修正",
      emoji: "🐛",
      value: "fix",
    },
    docs: {
      description: "ドキュメントだけの更新",
      emoji: "✏️",
      value: "docs",
    },
    style: {
      description:
        "コードの意味に影響しない変更 (空白, フォーマット, importのソート等)",
      emoji: "💄",
      value: "style",
    },
    refactor: {
      description: "バグ修正ではなく、機能追加ではないコードの変更",
      emoji: "💡",
      value: "refactor",
    },
    perf: {
      description: "パフォーマンスを改善するコードの変更",
      emoji: "⚡️",
      value: "perf",
    },
    test: {
      description: "テストコードの追加や修正",
      emoji: "💍",
      value: "test",
    },
    chore: {
      description: "ビルドプロセスやドキュメント生成ツールやライブラリの変更",
      emoji: "🤖",
      value: "chore",
    },
    messages: {
      type: "Select the type of change that you're committing:",
      customScope: "Select the scope this component affects:",
      subject: "Write a short, imperative mood description of the change:\n",
      body: "Provide a longer description of the change:\n ",
    },
  },
};
