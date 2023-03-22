From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Wed, 22 Mar 2023 13:01:25 +0100
Subject: [PATCH v5 06/13] riscv: fpu: switch has_fpu() to
 riscv_has_extension_likely()
In-Reply-To: <20230128172856.3814-7-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230128172856.3814-7-jszhang@kernel.org>
Message-ID: <ZBruFRwt3rUVngPu@zx2c4.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Sun, Jan 29, 2023 at 01:28:49AM +0800, Jisheng Zhang wrote:
> Switch has_fpu() from static branch to the new helper
> riscv_has_extension_likely().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/switch_to.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 11463489fec6..60f8ca01d36e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
>  
>  static __always_inline bool has_fpu(void)
>  {
> -	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> +		riscv_has_extension_likely(RISCV_ISA_EXT_d);

This causes programs to crash on kernels that are compiled with
CONFIG_RISCV_ALTERNATIVE=n. Since CONFIG_RISCV_ALTERNATIVE isn't
selectable, this is a problem.

You can try this out for yourself using the WireGuard test suite:

    ARCH=riscv64 make -C tools/testing/selftests/wireguard/qemu -j$(nproc)

And you'll see the crash:

[    2.172093] init.sh[45]: unhandled signal 4 code 0x1 at 0x00ffffff945a2170 in libc.so[ffffff94562000+8c000]
[    2.174306] CPU: 0 PID: 45 Comm: init.sh Not tainted 6.3.0-rc3+ #1
[    2.174981] Hardware name: riscv-virtio,qemu (DT)
[    2.175639] epc : 00ffffff945a2170 ra : 00aaaaaae7332820 sp : 00fffffffd3e6c00
[    2.176287]  gp : 00aaaaaae73aff40 tp : 00ffffff945f1a50 t0 : 0000000000000000
[    2.176858]  t1 : 00aaaaaae7331f9c t2 : 0000000000000002 s0 : 00fffffffd3e6de0
[    2.177427]  s1 : 0000000000000002 a0 : 00aaaaaae73b7380 a1 : 00fffffffd3e6dc8
[    2.177990]  a2 : 00fffffffd3e6de0 a3 : 0000000000000000 a4 : 0000000000000000
[    2.178524]  a5 : 0000000000000002 a6 : 000000000000008b a7 : 0000000000000010
[    2.179081]  s2 : 00aaaaaae73327f0 s3 : 00ffffff945ef990 s4 : 00ffffff945f1988
[    2.179796]  s5 : 00ffffff945f1b48 s6 : 0000000000000000 s7 : 00000000000000e0
[    2.180366]  s8 : 00ffffff945f1d58 s9 : 00ffffff945ecb88 s10: 00ffffff945f17e0
[    2.185464]  s11: 0000000000000001 t3 : 00ffffff945a213c t4 : 0000000300000000
[    2.186106]  t5 : 0000000000000003 t6 : ffffffffffffffff
[    2.186520] status: 0000000200000020 badaddr: 000000000000b920 cause: 0000000000000002

I bisected it to this commit:

    702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")

Thanks,
Jason

