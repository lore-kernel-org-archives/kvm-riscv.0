From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 21:00:54 +0000
Subject: [PATCH -next v14 15/19] riscv: signal: validate altstack to
 reflect Vector
In-Reply-To: <20230224170118.16766-16-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-16-andy.chiu@sifive.com>
Message-ID: <c9ae64d6-c11b-4309-a836-aa6d4eabc6e5@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:14PM +0000, Andy Chiu wrote:
> MINSIGSTKSZ alone have become less informative by the time an user calls
> sigaltstack(), as the kernel starts to support extensions that
> dynamically introduce footprint on a signal frame.

This sentence is a bit difficult to understand. I find re-hashing the
wording often helps me understand, so does the following mean the same
thing:
"Some extensions, such as vector, dynamically change the footprint of a
signal frame, so MINSIGSTKSZ is no longer accurate"
The wording "less informative" doesn't really mean anything, what could
happen here is that the sigaltstack could be larger the MINSIGSTKSZ and
would therefore be outright wrong?

> For example, an RV64V
> implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a signal
> frame with the upcoming Vector support.

> And there is no need for
> reserving the extra sigframe for some processes that do not execute any
> V-instructions.

Can you reword this sentence like the following, substituting for "so xyz"
please?
"Processes that do not execute any vector instructions do not need to
reserve the extra sigframe, so xyz".

> Thus, provide the function sigaltstack_size_valid() to validate its size
> based on current allocation status of supported extensions.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/signal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index aa8ee95dee2d..aff441e83a98 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -494,3 +494,11 @@ void __init init_rt_signal_env(void)
>  	 */
>  	signal_minsigstksz = cal_rt_frame_size(true);
>  }
> +
> +#ifdef CONFIG_DYNAMIC_SIGFRAME
> +bool sigaltstack_size_valid(size_t ss_size)
> +{
> +	return ss_size > cal_rt_frame_size(false);

Seeing it here made me wonder, what does "cal" mean. I assume it is
meant to be "calculate", but "cal" in my head is usually "calibrate".
s/cal/get in the patch adding that function IMO.

> +}
> +#endif /* CONFIG_DYNAMIC_SIGFRAME */

The change itself, if my understanding is correct, looks fine...

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/eb8d12bf/attachment.sig>
