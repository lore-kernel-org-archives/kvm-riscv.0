From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
Subject: [PATCH v2 0/4] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses
In-Reply-To: <20231213203001.179237-1-alexghiti@rivosinc.com>
References: <20231213203001.179237-1-alexghiti@rivosinc.com>
Message-ID: <170449142778.26226.7492189738418488414.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 13 Dec 2023 21:29:57 +0100 you wrote:
> This series is a follow-up for riscv of a recent series from Ryan [1] which
> converts all direct dereferences of pte_t into a ptet_get() access.
> 
> The goal here for riscv is to use READ_ONCE()/WRITE_ONCE() for all page
> table entries accesses to avoid any compiler transformation when the
> hardware can concurrently modify the page tables entries (A/D bits for
> example).
> 
> [...]

Here is the summary with links:
  - [v2,1/4] riscv: Use WRITE_ONCE() when setting page table entries
    https://git.kernel.org/riscv/c/c30fa83b4989
  - [v2,2/4] mm: Introduce pudp/p4dp/pgdp_get() functions
    https://git.kernel.org/riscv/c/eba2591d99d1
  - [v2,3/4] riscv: mm: Only compile pgtable.c if MMU
    https://git.kernel.org/riscv/c/d6508999d188
  - [v2,4/4] riscv: Use accessors to page table entries instead of direct dereference
    https://git.kernel.org/riscv/c/edf955647269

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



