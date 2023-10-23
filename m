From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 23 Oct 2023 12:03:44 +0200
Subject: [PATCH 4/5] riscv: kvm: Use SYM_*() assembly macros instead of
 deprecated ones
In-Reply-To: <20231004143054.482091-5-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-5-cleger@rivosinc.com>
Message-ID: <20231023-33c38ae1672a9006fb91671b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 04, 2023 at 04:30:53PM +0200, Cl?ment L?ger wrote:
> ENTRY()/END()/WEAK() macros are deprecated and we should make use of the
> new SYM_*() macros [1] for better annotation of symbols. Replace the
> deprecated ones with the new ones and fix wrong usage of END()/ENDPROC()
> to correctly describe the symbols.
> 
> [1] https://docs.kernel.org/core-api/asm-annotations.html
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_switch.S | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

