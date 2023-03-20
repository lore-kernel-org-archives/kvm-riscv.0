From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 20 Mar 2023 13:41:14 -0000
Subject: [PATCH -next v15 15/19] riscv: signal: validate altstack to
 reflect Vector
In-Reply-To: <20230317113538.10878-16-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-16-andy.chiu@sifive.com>
Message-ID: <3d5f165c-d6d2-46b9-80c6-7f159d67019c@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 17, 2023 at 11:35:34AM +0000, Andy Chiu wrote:
> Some extensions, such as Vector, dynamically change footprint on a
> signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
> RV64V implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a
> signal frame with the upcoming support. And processes that do not
> execute any vector instructions do not need to reserve the extra
> sigframe. So we need a way to guard the allocation size of the sigframe
> at process runtime according to current status of V.
> 
> Thus, provide the function sigaltstack_size_valid() to validate its size
> based on current allocation status of supported extensions.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/signal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index d2d9232498ca..b8ad9a7fc0ad 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -494,3 +494,11 @@ void __init init_rt_signal_env(void)
>  	 */
>  	signal_minsigstksz = get_rt_frame_size(true);
>  }
> +
> +#ifdef CONFIG_DYNAMIC_SIGFRAME
> +bool sigaltstack_size_valid(size_t ss_size)
> +{
> +	return ss_size > get_rt_frame_size(false);

btw, thanks for using a clearer function name w/ the s/cal/get/ change &
for the expansion on the commit message.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +}
> +#endif /* CONFIG_DYNAMIC_SIGFRAME */
> +
> -- 
> 2.17.1
> 
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230320/ff555cd8/attachment-0001.sig>
