From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Tue, 07 Nov 2023 06:50:26 +0000
Subject: [PATCH v2 0/5] riscv: cleanup assembly usage of ENTRY()/END() and use
 local labels
In-Reply-To: <20231024132655.730417-1-cleger@rivosinc.com>
References: <20231024132655.730417-1-cleger@rivosinc.com>
Message-ID: <169933982669.6233.10371170118616950256.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 24 Oct 2023 15:26:50 +0200 you wrote:
> This series does a cleanup of all ENTRY()/END() macros that are used in
> arch/riscv/ as well as use of local labels. This allows to remove the
> use of the now deprecated ENTRY()/END()/WEAK() macros as well as using
> the new SYM_*() ones which provide a better understanding of what is
> meant to be annotated. Some wrong usage of SYM_FUNC_START() are also
> fixed in this series by using the correct annotations. Finally a few
> labels that were meant to be local have been renamed to use the .L
> suffix and thus not to be emitted as visible symbols.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] riscv: use ".L" local labels in assembly when applicable
    https://git.kernel.org/riscv/c/b18f7296fbfd
  - [v2,2/5] riscv: Use SYM_*() assembly macros instead of deprecated ones
    https://git.kernel.org/riscv/c/76329c693924
  - [v2,3/5] riscv: kernel: Use correct SYM_DATA_*() macro for data
    https://git.kernel.org/riscv/c/4cc0d8a3f109
  - [v2,4/5] riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
    (no matching commit)
  - [v2,5/5] riscv: kvm: use ".L" local labels in assembly when applicable
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



