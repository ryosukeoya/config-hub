module.exports = {
  disableEmoji: true,
  format: '[{scope}] {type}: {emoji}{subject}',
  // Bug: scopeがinteractive modeで入力できない
  questions: ['type', 'scope', 'subject', 'body'],
  list: ['feat', 'fix', 'docs', 'style', 'refactor', 'perf', 'test', 'chore'],
  maxMessageLength: 100,
  minMessageLength: 3,
  scopes: [],
  types: {
    feat: {
      description: '新しい機能',
      emoji: '🎸',
      value: 'feat',
    },
    fix: {
      description: 'バグ修正',
      emoji: '🐛',
      value: 'fix',
    },
    docs: {
      description: 'ドキュメントだけの更新',
      emoji: '✏️',
      value: 'docs',
    },
    style: {
      description:
        'コードの意味に影響しない変更 (空白, フォーマット, importのソート等)',
      emoji: '💄',
      value: 'style',
    },
    refactor: {
      description: 'バグ修正ではなく、機能追加ではないコードの変更',
      emoji: '💡',
      value: 'refactor',
    },
    perf: {
      description: 'パフォーマンスを改善するコードの変更',
      emoji: '⚡️',
      value: 'perf',
    },
    test: {
      description: 'テストコードの追加や修正',
      emoji: '💍',
      value: 'test',
    },
    chore: {
      description: 'ビルドプロセスやドキュメント生成ツールやライブラリの変更',
      emoji: '🤖',
      value: 'chore',
    },
    messages: {
      scope: 'Write the changes using the <module/dir> format:',
      type: "Select the type of change that you're committing:",
      subject: 'Write a short, imperative mood description of the change:\n',
      body: 'Provide a longer description of the change:\n ',
    },
  },
};
