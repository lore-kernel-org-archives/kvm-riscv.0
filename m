From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 23 Oct 2023 11:59:26 +0200
Subject: [PATCH 1/5] riscv: use ".L" local labels in assembly when
 applicable
In-Reply-To: <20231004143054.482091-2-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-2-cleger@rivosinc.com>
Message-ID: <20231023-8397e25545716f7f168e9007@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 04, 2023 at 04:30:50PM +0200, Cl?ment L?ger wrote:
> For the sake of coherency, use local labels in assembly when
> applicable. This also avoid kprobes being confused when applying a
> kprobe since the size of function is computed by checking where the
> next visible symbol is located. This might end up in computing some
> function size to be way shorter than expected and thus failing to apply
> kprobes to the specified offset.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/entry.S  | 10 +++----
>  arch/riscv/kernel/head.S   | 18 ++++++-------
>  arch/riscv/kernel/mcount.S | 10 +++----
>  arch/riscv/lib/memmove.S   | 54 +++++++++++++++++++-------------------
>  4 files changed, 46 insertions(+), 46 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

