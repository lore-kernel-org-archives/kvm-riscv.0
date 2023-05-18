From: Conor Dooley <conor@kernel.org>
Date: Thu, 18 May 2023 18:47:34 +0100
Subject: [PATCH -next v20 11/26] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <20230518161949.11203-12-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-12-andy.chiu@sifive.com>
Message-ID: <20230518-external-sixteen-f2d2ae444547@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 18, 2023 at 04:19:34PM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Hey Heiko and Conor, I am dropping you guys' A-b, T-b, and R-b because I
> added a check in riscv_v_first_use_handler().

> +bool riscv_v_first_use_handler(struct pt_regs *regs)
> +{
> +	u32 __user *epc = (u32 __user *)regs->epc;
> +	u32 insn = (u32)regs->badaddr;
> +
> +	/* Do not handle if V is not supported, or disabled */
> +	if (!has_vector() || !(elf_hwcap & COMPAT_HWCAP_ISA_V))
> +		return false;

Remind me please, in what situation is this actually even possible?
The COMPAT_HWCAP_ISA_V flag only gets set if CONFIG_RISCV_ISA_V is
enabled & v is in the DT.
has_vector() is backed by different things whether alternatives are
enabled or not. With alternatives, it depends on the bit being set in
the riscv_isa bitmap & the Kconfig option.
Without alternatives it is backed by __riscv_isa_extension_available()
which only depends in the riscv_isa bitmap.
Since the bit in the bitmap does not get cleared if CONFIG_RISCV_ISA_V
is not set, unlike the elf_hwcap bit which does, it seems like this
might be the condition you are trying to prevent?

If so,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Otherwise, please let me know where I have gone wrong!

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230518/e05ed642/attachment.sig>
